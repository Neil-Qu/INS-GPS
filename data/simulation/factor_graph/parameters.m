% --------------- Switches (options) ---------------
SWITCH_REDUCE_TESTING= 1; % to test only a few frames
SWITCH_VIRT_UPDATE_Z= 0; % virtual update for the z-vel in the body frame
SWITCH_VIRT_UPDATE_Y= 0; % virtual update for the y-vel in the body frame
SWITCH_YAW_UPDATE= 1;
SWITCH_GPS_UPDATE= 0; % update of the GPS
SWITCH_GPS_VEL_UPDATE= 0; % update of the GPS
SWITCH_LIDAR_UPDATE= 1;
SWITCH_REMOVE_FAR_FEATURES= 1;
SWITCH_CALIBRATION= 1; % initial calibration to obtain moving biases
SWITCH_FIXED_LM_SIZE_PH= 1;
SWITCH_LM_SELECTION= 0; % activate landmarks selection
SWITCH_SEED= 0; % seed for random (zero for deactivate)
SWITCH_ONLY_ONE_LM_FAULT= 1; % if only one simultaneous landmark fault
SWITCH_GENERATE_RANDOM_MAP= 1; % if the map is randomly generate at initialization
SWITCH_LIDAR_FAULTS= 1; % if we want to inject faults in the lidar msmts
% --------------------------------------------------


% --------------- Parameters ---------------
m= 3; % number of states in the state vector
I_MA= 1e-8; 
P_MA_max= 1e-4; % maximum allowable miss-association probability for one association
I_H= 1e-6; % risk allocated to unmonitored fault modes
P_UA= 1e-3;
min_n_L_M= 10; % min number of landmarks in preceding horizon
preceding_horizon_size= 3;
continuity_requirement= 1e-5;
alert_limit= 0.5;
min_appearances= 2; % only update estimate landmarks detected more than this number
num_epochs_reduce_testing= 5000;
num_epochs_static= 10000; % Number of epochs the robot is static initially
lidarRange= 25; % [m]
initial_yaw_angle= 0; % [deg] initial yaw angle (different for each experiment) % smooth_turn(180)
m_F= 2; % measurements per feature/landmark
dt_imu= 1/125; % IMU sampling time
dt_cal= 1/10; % KF Update period during initial calibration
dt_virt_z= 1/10; % Virtual msmt update period
dt_virt_y= 1/10; % Virtual msmt update period
sig_cal_pos= 0.01; % 3cm   -- do not reduce too much or bias get instable
sig_cal_vel= 0.01; % 3cm/s -- do not reduce too much or bias get instable
sig_cal_E= deg2rad(0.1); % 0.1 deg
sig_yaw0= deg2rad(5); % 5 deg -- Initial uncertatinty in yaw
sig_phi0= deg2rad(1); % 2 deg -- Initial uncertatinty in attitude
sig_ba= 0.05; % 0.1 m/s2 -- Initial acc bias uncertainty
sig_bw= deg2rad(0.1); % 0.2 deg/s -- Initial gyros bias uncertainty
sig_virt_vz= 0.01; % 5cm/s -- virtual msmt SD in z
sig_virt_vy= 0.01; % 5cm/s -- virtual msmt SD in y
sig_lidar= 0.20; % 25cm -- lidar measurement in the nav frame
min_vel_gps= 2/3.6; % 2 km/h
min_vel_yaw= 2/3.6; % 2 km/h
taua_normal_operation= 3000; % Tau for acc bias -- from manufacturer
tauw_normal_operation= 3000; % Tau for gyro bias -- from manufacturer
taua_calibration= 100; % 200 acc tau value during initial calibration
tauw_calibration= 100; % 200 gyro tau value during initial calibration
g_val= 9.80279; % value of g [m/s2] at the IIT
r_IMU2rearAxis= 0.9; % distance from IMU to rear axis
alpha_NN= 0.01; % prob of discard good features in NN (inv-proportional to size of gate)
threshold_new_landmark= 15; % Threshold in NIS to create a new landmark
sig_minLM= 0.1; % minimum SD for the landmarks
mult_factor_acc_imu= 10; % multiplicative factor for the accel SD
mult_factor_gyro_imu= 10; % multiplicative factor for the gyros SD
mult_factor_pose_gps= 1; % multiplicative factor for the GPS pose SD
mult_factor_vel_gps= 1;  % multiplicative factor for the GPS velocity SD
feature_height= 1.5; % height of the features
VRW= 0.07; % vel random walk
ARW= 0.15; % angular random walk [deg]
sn_f= ( 0.05 * 9.80279 / 1000 )^2; % bias acc white noise PSD
sn_w= ( deg2rad(0.3/3600) )^2;    % bias gyro white noise PSD

% --------------- Simulation & factor graphs -----------------
num_epochs_sim= 10000;
dt_sim= 0.1; % time step for the simulation (equal for all updates)
dt_gps= 1; % time step for the GPS in simulation
sig_gps_sim= 0.2; % standar deviation for GPS in simulation (all z-y-x)
velocity_sim= 25 / 3.6; % [m/s]
steering_angle_sim= deg2rad(0);
sig_velocity_sim= 1; % [m/s]
sig_steering_angle_sim= deg2rad(2); % [rad]
wheelbase_sim= 1; % for the simulated car
% way_points= [[10;-5], [40;-20], [70;0], [40;20], [10;5], [0;0]];
% way_points= [ [50;-20], [100;-20], [100;20], [50; 20], [0;0]];
way_points= [ [40;-20], [80;20], [120;-20], [160;20], [200;0]];
min_distance_to_way_point= 2;
max_delta_steering= deg2rad( 20 ); % maximum change in steering angle during one second
max_steering= deg2rad( 10 );
sig_gyro_z= deg2rad(3); % [rad/s]  standard dev of the gyro
map_limits= [-25, 230, -50, 50]; % [x_min, x_max, y_min,  y_max] 
optimoptions_display= 'notify'; % display options for the factor graphs optimization 
landmark_density= 0.005; % [landmarks / m^2]
% -------------------------------------------