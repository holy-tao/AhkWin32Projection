#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_QOS_CLASS_IE {
    #StructPack 1

    QOSClassForward : Int8

    QOSClassBackward : Int8

}
