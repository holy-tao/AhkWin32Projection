#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CameraControlProperty enumeration specifies a setting on a camera.
 * @remarks
 * For a given property, a particular device might implement only a subset of the listed range.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolproperty
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class CameraControlProperty extends Win32Enum{

    /**
     * Specifies the camera's pan setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values are clockwise from the origin (the camera rotates clockwise when viewed from above), and negative values are counterclockwise from the origin.
     * @type {Integer (Int32)}
     */
    static CameraControl_Pan => 0

    /**
     * Specifies the camera's tilt setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values point the imaging plane up, and negative values point the imaging plane down.
     * @type {Integer (Int32)}
     */
    static CameraControl_Tilt => 1

    /**
     * Specifies the camera's roll setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values cause a clockwise rotation of the camera along the image-viewing axis, and negative values cause a counterclockwise rotation of the camera.
     * @type {Integer (Int32)}
     */
    static CameraControl_Roll => 2

    /**
     * Specifies the camera's zoom setting, in millimeters. Values range from 10 to 600, and the default is specific to the device.
     * @type {Integer (Int32)}
     */
    static CameraControl_Zoom => 3

    /**
     * Specifies the exposure setting, in log base 2 seconds. In other words, for values less than zero, the exposure time is 1/2^n seconds, and for values zero or above, the exposure time is 2^n seconds. For example:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Seconds
     *                 </th>
     * </tr>
     * <tr>
     * <td>-3</td>
     * <td>1/8</td>
     * </tr>
     * <tr>
     * <td>-2</td>
     * <td>1/4</td>
     * </tr>
     * <tr>
     * <td>-1</td>
     * <td>1/2</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>4</td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static CameraControl_Exposure => 4

    /**
     * Specifies the camera's iris setting, in units of fₛₜₒₚ* 10.
     * @type {Integer (Int32)}
     */
    static CameraControl_Iris => 5

    /**
     * Specifies the camera's focus setting, as the distance to the optimally focused target, in millimeters. The range and default value are specific to the device.
     * @type {Integer (Int32)}
     */
    static CameraControl_Focus => 6
}
