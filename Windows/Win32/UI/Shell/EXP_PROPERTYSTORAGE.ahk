#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores information about the Shell link state. This structure is used for extra data sections that are tagged with EXP_PROPERTYSTORAGE_SIG.
 * @remarks
 * EXP_PROPERTYSTORAGE is used to store information serialized by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> object.  It is named with the tag value EXP_PROPERTYSTORAGE_SIG and can be accessed via <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist">IShellLinkDataList</a>, including operations for add, remove, and copy. This block can be used to inspect the Shell link state.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_propertystorage
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EXP_PROPERTYSTORAGE {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * Identifies the type of block and is the value EXP_PROPERTYSTORAGE_SIG.
     */
    dwSignature : UInt32

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A serialized property store in the format defined by SERIALIZEDPROPSTORAGE.
     */
    abPropertyStorage : Int8[1]

}
