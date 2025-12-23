#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes FLATMTSIDLIST and provides syntax, members, and additional remarks.
 * @remarks
 * The **FLATMTSIDLIST** structure's use in X.400 messaging corresponds to the [FLATENTRYLIST](flatentrylist.md) structure's use in MAPI messaging. MAPI uses **FLATMTSIDLIST** structures to maintain X.400 properties during message handling. Service providers use **FLATMTSIDLIST** structures when handling incoming and outgoing X.400 messages. 
 *   
 * In the **abMTSIDs** array, each **MTSID** structure is aligned on a naturally aligned boundary. Extra bytes are included as padding to make sure natural alignment between any two **MTSID** structures. The first **MTSID** structure in the array is always aligned correctly because the offset of the **abMTSIDs** member is 8. To compute the offset of the next structure, use the size of the first entry rounded up to the next multiple of 4. Use the [CbNewMTSID](cbnewmtsid.md) macro to compute the size of an **MTSID** structure.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/flatmtsidlist
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class FLATMTSIDLIST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * > Count of **MTSID** structures in the array described by the **abMTSIDs** member.
     * @type {Integer}
     */
    cMTSIDs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Count of bytes in the array described by **abMTSIDs**.
     * @type {Integer}
     */
    cbMTSIDs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Byte array that contains one or more **MTSID** structures.
     * @type {Array<Byte>}
     */
    abMTSIDs{
        get {
            if(!this.HasProp("__abMTSIDsProxyArray"))
                this.__abMTSIDsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__abMTSIDsProxyArray
        }
    }
}
