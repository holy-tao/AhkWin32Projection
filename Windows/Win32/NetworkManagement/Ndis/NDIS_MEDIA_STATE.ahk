#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_MEDIA_STATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediaStateConnected => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediaStateDisconnected => 1
}
