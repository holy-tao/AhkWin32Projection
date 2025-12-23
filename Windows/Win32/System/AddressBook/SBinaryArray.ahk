#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of binary values. The SBinaryArray structure is used to describe properties of type PT_MV_BINARY.
 * @remarks
 * The **SBinaryArray** structure is used to describe properties of type PT_MV_BINARY. 
 *   
 * For more information about PT_MV_BINARY, see [List of Property Types](property-types.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/sbinaryarray
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SBinaryArray extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Count of values in the array pointed to by the **lpbin** member.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to an array of [SBinary](sbinary.md) structures that holds the binary values.
     * @type {Pointer<SBinary>}
     */
    lpbin {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
