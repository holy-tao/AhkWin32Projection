#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_MEDIA_STATE extends Win32Enum {

    /**
     * Native name: NdisMediaStateConnected
     * @type {Integer (Int32)}
     */
    static Connected => 0

    /**
     * Native name: NdisMediaStateDisconnected
     * @type {Integer (Int32)}
     */
    static Disconnected => 1
}
