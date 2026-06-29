#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_WMDRM_RENEWLICENSE {
    #StructPack 4

    lResult : Int32

    ulDescrambleStatus : UInt32

    ulXmrLicenseOutputLength : UInt32

    argbXmrLicenceOutputBuffer : Int8[1]

}
