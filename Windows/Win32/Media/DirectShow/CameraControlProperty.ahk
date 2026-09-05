#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CameraControlProperty enumeration specifies a setting on a camera.
 * @remarks
 * For a given property, a particular device might implement only a subset of the listed range.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolproperty
 * @namespace Windows.Win32.Media.DirectShow
 */
class CameraControlProperty extends Win32Enum {

    /**
     * Specifies the camera's pan setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values are clockwise from the origin (the camera rotates clockwise when viewed from above), and negative values are counterclockwise from the origin.
     * Native name: CameraControl_Pan
     * @type {Integer (Int32)}
     */
    static Pan => 0

    /**
     * Specifies the camera's tilt setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values point the imaging plane up, and negative values point the imaging plane down.
     * Native name: CameraControl_Tilt
     * @type {Integer (Int32)}
     */
    static Tilt => 1

    /**
     * Specifies the camera's roll setting, in degrees. Values range from –180 to +180, with the default set to zero. Positive values cause a clockwise rotation of the camera along the image-viewing axis, and negative values cause a counterclockwise rotation of the camera.
     * Native name: CameraControl_Roll
     * @type {Integer (Int32)}
     */
    static Roll => 2

    /**
     * Specifies the camera's zoom setting, in millimeters. Values range from 10 to 600, and the default is specific to the device.
     * Native name: CameraControl_Zoom
     * @type {Integer (Int32)}
     */
    static Zoom => 3

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
     * Native name: CameraControl_Exposure
     * @type {Integer (Int32)}
     */
    static Exposure => 4

    /**
     * Specifies the camera's iris setting, in units of fₛₜₒₚ* 10.
     * Native name: CameraControl_Iris
     * @type {Integer (Int32)}
     */
    static Iris => 5

    /**
     * Specifies the camera's focus setting, as the distance to the optimally focused target, in millimeters. The range and default value are specific to the device.
     * Native name: CameraControl_Focus
     * @type {Integer (Int32)}
     */
    static Focus => 6
}
