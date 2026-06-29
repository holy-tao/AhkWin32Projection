#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEITEM {
    #StructPack 8

    cbSize : Int32 := this.Size

    iType : Int32

    lpItemData : IntPtr

}
