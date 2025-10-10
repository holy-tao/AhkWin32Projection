#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIFFOBJECTATTRIBUTES structure describes the information contained in the &quot;FFAttributes&quot; value of the registry key for each &quot;object&quot; on a force-feedback device.
 * @see https://docs.microsoft.com/windows/win32/api//dinputd/ns-dinputd-diffobjectattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIFFOBJECTATTRIBUTES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the magnitude of the maximum force that can be created by the actuator associated with this object. Force is expressed in Newtons and measured in relation to where the hand would be during <b>Normal</b> operation of the device. If this member is zero, the object is assumed not to support force feedback.
     * @type {Integer}
     */
    dwFFMaxForce {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the force resolution of the actuator associated with this object. The returned value represents the number of gradations, or subdivisions, of the maximum force that can be expressed by the force feedback system from 0 (no force) to maximum force.
     * @type {Integer}
     */
    dwFFForceResolution {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
