#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_TOKEN extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BG_TOKEN_LOCAL_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_TOKEN_NETWORK => 2
}
