#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The POLICY_ELEMENT (lpmapi.h) structure contains an RSVP policy element.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-policy_element
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class POLICY_ELEMENT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Length of the Policy Element, in bytes.
     * @type {Integer}
     */
    usPeLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Policy Element type.
     * @type {Integer}
     */
    usPeType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Policy Element data.
     * @type {Array<Byte>}
     */
    ucPeData{
        get {
            if(!this.HasProp("__ucPeDataProxyArray"))
                this.__ucPeDataProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__ucPeDataProxyArray
        }
    }
}
