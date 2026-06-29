#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by delegate folders in place of a standard ITEMIDLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-delegateitemid
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DELEGATEITEMID {
    #StructPack 2

    /**
     * Type: <b>WORD</b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt16 := this.Size

    /**
     * Type: <b>WORD</b>
     * 
     * Private data owned by the delegating (outer) folder.
     */
    wOuter : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * The size, in bytes, of the delegate's data. The first <b>cbInner</b> bytes of the <b>rgb</b> array contain this data. The remaining data in <b>rgb</b> belongs to the outer folder.
     */
    cbInner : UInt16

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * An array holding the inner folder's data, which is opaque to the outer folder, followed by outer folder's data.
     */
    rgb : Int8[1]

}
