#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_WMDRM_STATUS {
    #StructPack 8

    lResult : Int32

    ulMaxCaptureTokenSize : UInt32

    uMaxStreamingPid : UInt32

    ulMaxLicense : UInt32

    ulMinSecurityLevel : UInt32

    ulRevInfoSequenceNumber : UInt32

    ulRevInfoIssuedTime : Int64

    ulRevListVersion : UInt32

    ulRevInfoTTL : UInt32

    ulState : UInt32

}
