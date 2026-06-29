#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct AAL5_PARAMETERS {
    #StructPack 4

    ForwardMaxCPCSSDUSize : UInt32

    BackwardMaxCPCSSDUSize : UInt32

    Mode : Int8

    SSCSType : Int8

}
