#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RSVP_POLICY structure stores one or more undefined policy elements.
 * @remarks
 * RSVP transports the data contained in an <b>RSVP_POLICY</b> structure on behalf of the Policy Control component.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_policy
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class RSVP_POLICY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Size of the entire element object, in bytes.
     * @type {Integer}
     */
    Len {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type of RSVP policy element  in <b>Info</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Policy data, expressed in UCHARs.
     * @type {Array<Byte>}
     */
    Info{
        get {
            if(!this.HasProp("__InfoProxyArray"))
                this.__InfoProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__InfoProxyArray
        }
    }
}
