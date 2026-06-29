#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_CONNECTION_ID {
    #StructPack 4

    DeviceNumber : UInt32

    VPI : UInt32

    VCI : UInt32

}
