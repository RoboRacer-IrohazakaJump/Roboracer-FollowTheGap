# The Follow-the-Gap Algorithm

The Follow-the-Gap algorithm is a simple but effective algorithm commonly used in autonomous robot, autonomous racing, and vehicle navigation with the idea of obstacle avoidance in unknown or dynamic environments. The objective of this algorithm is to find a collision-free path by identifying the largest gap in the sensor data from LiDAR, or other range sensors.

In this project, we implement the FTG algorithm as an approach for autonomous racing in [Roborace Autonomous Racing](https://autodrive-ecosystem.github.io/competitions/roboracer-sim-racing-cdc-tf-2025/), enabling real-time obstacle avoidance by steering the vehicle toward the largest navigable gap derived from LiDAR data. The core ideas of FTG are as follows:
1. Use LiDAR sensor measures distances to surrounding obstacles (walls) within a 270° field of view (-135° to 135°) relative to the vehicle's heading.
2. Identify all gaps in the sensor data; a gap is a continuous sequences of points with distances greater than a safety threshold (e.g., the vehicle's radius based on its length and width).
3. Find the **largest gap** (the widest collision-free path).
4. Direct the vehicle towards the furthest point in free space and set steering angle towards it.
