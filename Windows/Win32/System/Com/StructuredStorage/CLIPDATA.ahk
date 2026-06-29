#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CLIPDATA {
    #StructPack 8

    cbSize : UInt32 := this.Size

    ulClipFmt : Int32

    pClipData : IntPtr

}
