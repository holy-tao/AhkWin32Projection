#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the properties, members, and remarks for MTSID, which contains an X.400 message transport system (MTS) entry identifier.
 * @remarks
 * The **MTSID** structure is used only for X.400 mappings of MAPI entry identifiers. It corresponds to the MAPI [FLATENTRY](flatentry.md) structure. 
 *   
 * An MTS identifier has the same format as a MAPI entry identifier or a binary property value. MTS identifiers can be particularly useful for canceling deferred messages.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mtsid
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MTSID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Count of bytes in the array described by the **abEntry** member.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ab{
        get {
            if(!this.HasProp("__abProxyArray"))
                this.__abProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__abProxyArray
        }
    }
}
