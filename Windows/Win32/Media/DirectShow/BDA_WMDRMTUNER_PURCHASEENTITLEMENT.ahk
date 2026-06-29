#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_WMDRMTUNER_PURCHASEENTITLEMENT {
    #StructPack 4

    lResult : Int32

    ulDescrambleStatus : UInt32

    ulCaptureTokenLength : UInt32

    argbCaptureTokenBuffer : Int8[1]

}
