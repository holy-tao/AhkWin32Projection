#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_FAST_FORWARDING_STATE.ahk" { WINHTTP_FAST_FORWARDING_STATE }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_FAST_FORWARDING_STATUS {
    #StructPack 8

    TransferState : WINHTTP_FAST_FORWARDING_STATE

    NtStatus : Int32

    dwError : UInt32

    ullBytesTransferred : Int64

}
