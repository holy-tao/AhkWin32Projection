#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct INSERTPSUIPAGE_INFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Type : Int8

    Mode : Int8

    dwData1 : IntPtr

    dwData2 : IntPtr

    dwData3 : IntPtr

}
