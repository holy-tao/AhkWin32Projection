#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the CFSTR_SHELLIDLIST clipboard format to transfer the pointer to an item identifier list (PIDL) of one or more Shell namespace objects.
 * @remarks
 * 
 * To use this structure to retrieve a particular PIDL, add the <b>aoffset</b> value of the PIDL to the address of the structure. The following two macros can be used to retrieve PIDLs from the structure. The first retrieves the PIDL of the parent folder. The second retrieves a PIDL, specified by its zero-based index.
 * 				
 *                 
 * 
 * 
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-cida
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CIDA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * The number of PIDLs that are being transferred, not including the parent folder.
     * @type {Integer}
     */
    cidl {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT[1]</b>
     * 
     * An array of offsets, relative to the beginning of this structure. The array contains <b>cidl</b>+1 elements. The first element of <b>aoffset</b> contains an offset to the fully qualified PIDL of a parent folder. If this PIDL is empty, the parent folder is the desktop. Each of the remaining elements of the array contains an offset to one of the PIDLs to be transferred. All of these PIDLs are relative to the PIDL of the parent folder.
     * @type {Array<UInt32>}
     */
    aoffset{
        get {
            if(!this.HasProp("__aoffsetProxyArray"))
                this.__aoffsetProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__aoffsetProxyArray
        }
    }
}
