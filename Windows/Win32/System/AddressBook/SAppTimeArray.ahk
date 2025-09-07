#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of time values. The SAppTimeArray structure is used to define properties of type PT_MV_APPTIME.
 * @remarks
 * The **SAppTimeArray** structure is used to define properties of type PT_MV_APPTIME. For more information about PT_MV_APPTIME, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sapptimearray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SAppTimeArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of values in the array pointed to by the **lpat** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of application time values.
     * @type {Pointer<Double>}
     */
    lpat {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
