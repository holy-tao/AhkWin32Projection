#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_WMDRM_KEYINFOLIST {
    #StructPack 8

    lResult : Int32

    ulKeyuuidBufferLen : UInt32

    argKeyuuidBuffer : IntPtr[1]

}
