#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CameraControlFlags enumeration defines whether a camera setting is controlled manually or automatically.
 * @remarks
 * 
 * In addition, the following flags are defined in Ksmedia.h:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>KSPROPERTY_CAMERACONTROL_FLAGS_AUTO</b></td>
 * <td>0X0001L</td>
 * <td>Equivalent to CameraControl_Flags_Auto.</td>
 * </tr>
 * <tr>
 * <td><b>KSPROPERTY_CAMERACONTROL_FLAGS_MANUAL</b></td>
 * <td>0X0002L</td>
 * <td>Equivalent to CameraControl_Flags_Manual.</td>
 * </tr>
 * <tr>
 * <td><b>KSPROPERTY_CAMERACONTROL_FLAGS_ABSOLUTE</b></td>
 * <td>0X0000L</td>
 * <td>The camera supports absolute units for this setting.</td>
 * </tr>
 * <tr>
 * <td><b>KSPROPERTY_CAMERACONTROL_FLAGS_RELATIVE</b></td>
 * <td>0X0010L</td>
 * <td>The camera supports relative controls for this setting. A relative control is divided into a number of steps with no defined units. The absolute size of each step depends on the camera model.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-cameracontrolflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class CameraControlFlags extends Win32Enum{

    /**
     * The setting is controlled automatically.
     * @type {Integer (Int32)}
     */
    static CameraControl_Flags_Auto => 1

    /**
     * The setting is controlled manually.
     * @type {Integer (Int32)}
     */
    static CameraControl_Flags_Manual => 2
}
