#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the measurement system for a depth value in a video frame.
 * @remarks
 * 
 * Use a value from this enumeration with the [MF_MT_DEPTH_MEASUREMENT](/windows/win32/medfound/mf-mt-depth-measurement) attribute.
 * 
 * The distance to focal plane is typically easier to consume in a 3D Euclidian coordinate system.
 * 
 * ![Illustration of DistanceToFocalPlane](images/distance_to_focal_plane.png)
 * 
 * The distance to focal center format is typically raw data from sensor such as time of flight cameras.
 * 
 * ![Illustration of DistanceToOpticalCenter](images/distance_to_optical_center.png)
 *   
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfdepthmeasurement
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFDepthMeasurement{

    /**
     * The measurement is the distance to the focal plane.
     * @type {Integer (Int32)}
     */
    static DistanceToFocalPlane => 0

    /**
     * The measurement is the distance to the optical center.
     * @type {Integer (Int32)}
     */
    static DistanceToOpticalCenter => 1
}
