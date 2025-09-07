#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information about the Shell link state. This structure is used for extra data sections that are tagged with EXP_PROPERTYSTORAGE_SIG.
 * @remarks
 * EXP_PROPERTYSTORAGE is used to store information serialized by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> object.  It is named with the tag value EXP_PROPERTYSTORAGE_SIG and can be accessed via <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist">IShellLinkDataList</a>, including operations for add, remove, and copy. This block can be used to inspect the Shell link state.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_propertystorage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXP_PROPERTYSTORAGE extends Win32Struct
{
    static sizeof => 9

    static packingSize => 1

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Identifies the type of block and is the value EXP_PROPERTYSTORAGE_SIG.
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A serialized property store in the format defined by SERIALIZEDPROPSTORAGE.
     * @type {Array<Byte>}
     */
    abPropertyStorage{
        get {
            if(!this.HasProp("__abPropertyStorageProxyArray"))
                this.__abPropertyStorageProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__abPropertyStorageProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 9
    }
}
