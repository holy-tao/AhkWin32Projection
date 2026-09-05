#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
class BG_TOKEN extends Win32Enum {

    /**
     * Native name: BG_TOKEN_LOCAL_FILE
     * @type {Integer (UInt32)}
     */
    static LOCAL_FILE => 1

    /**
     * Native name: BG_TOKEN_NETWORK
     * @type {Integer (UInt32)}
     */
    static NETWORK => 2
}
