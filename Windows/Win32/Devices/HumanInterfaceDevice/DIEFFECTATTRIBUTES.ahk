#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIEFFECTATTRIBUTES structure describes the information contained in the &quot;Attributes&quot; value of the registry key for each effect that is supported by a force-feedback device.
 * @remarks
 * 
  * For information about the DIEFFECT, DICONSTANTFORCE, DIRAMPFORCE, DIPERIODIC, DICONDITION, DICUSTOMFORCE, and DIENVELOPE structures, see the DirectInput section of the DirectX SDK.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-dieffectattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIEFFECTATTRIBUTES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies an arbitrary 32-bit value that is passed to the driver to identify the effect. The driver receives this value as the <i>dwEffectID</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputeffectdriver-downloadeffect">IDirectInputEffectDriver::DownloadEffect</a> method.
     * @type {Integer}
     */
    dwEffectId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwEffType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Describes the parameters supported by the effect. For example, if DIEP_ENVELOPE is set, then the effect supports an envelope. All effects should support at least DIEP_DURATION, DIEP_AXES, and DIEP_TYPESPECIFICPARAMS. It is not an error for an application to attempt to use effect parameters that are not supported by the device. The unsupported parameters are merely ignored. This value can be zero, one, or more of the following flags:
     * @type {Integer}
     */
    dwStaticParams {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Describes the parameters of the effect that can be modified while the effect is playing. If an application attempts to change a parameter while the effect is playing, and the driver does not support modifying that effect dynamically, then the driver will return DIERR_EFFECTPLAYING. This member uses the same flags as the <b>dwStaticParams</b> member, except that the flags are interpreted as describing whether the driver can modify the parameters of an effect while the effect is playing, rather than while it is not playing.
     * @type {Integer}
     */
    dwDynamicParams {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * One or more coordinate system flags (DIEFF_CARTESIAN, DIEFF_POLAR, DIEFF_SPHERICAL) indicating which coordinate systems are supported by the effect. At least one coordinate system must be supported. If an application attempts to set a direction in an unsupported coordinate system, DirectInput automatically converts it to a coordinate system that the device does support.
     * @type {Integer}
     */
    dwCoords {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
