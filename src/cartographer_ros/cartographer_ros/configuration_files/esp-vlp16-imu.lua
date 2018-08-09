-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "base_link",
  published_frame = "base_link",
  odom_frame = "odom",
  provide_odom_frame = false,
  publish_frame_projected_to_2d = false,
  use_odometry = false,
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 0,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 1,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 0.1,
  imu_sampling_ratio = 0.1,
  landmarks_sampling_ratio = 1.,
}

TRAJECTORY_BUILDER_3D.submaps.num_range_data = 400
TRAJECTORY_BUILDER_3D.min_range = 1.
TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 1
TRAJECTORY_BUILDER_3D.max_range = 100.
TRAJECTORY_BUILDER_3D.use_online_correlative_scan_matching = true  
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.linear_search_window = 0.1  
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10.  
TRAJECTORY_BUILDER_3D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-1

MAP_BUILDER.use_trajectory_builder_2d = true
MAP_BUILDER.use_trajectory_builder_3d = false

TRAJECTORY_BUILDER_2D.submaps.num_range_data = 400
TRAJECTORY_BUILDER_2D.min_range = 1.
TRAJECTORY_BUILDER_2D.max_range = 200.
TRAJECTORY_BUILDER_2D.num_accumulated_range_data = 1
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = false  
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.1  
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10.  
TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-1

TRAJECTORY_BUILDER_2D.use_imu_data = true

MAP_BUILDER.num_background_threads = 10
POSE_GRAPH.optimization_problem.huber_scale = 1e2
POSE_GRAPH.optimize_every_n_nodes = 400
-- POSE_GRAPH.optimize_every_n_nodes = 400
POSE_GRAPH.constraint_builder.sampling_ratio = 0.03
POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 10
POSE_GRAPH.constraint_builder.min_score = 0.6
-- POSE_GRAPH.constraint_builder.min_score = 0.8
POSE_GRAPH.constraint_builder.global_localization_min_score = 0.66
POSE_GRAPH.optimization_problem.log_solver_summary = true
-- POSE_GRAPH.constraint_builder.max_constraint_distance = 10
-- POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher_3d.set_linear_search_window = 100
-- POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher_3d.set_angular_search_window = math.rad(60.)


return options
