#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class PROOF_OF_POSSESSION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PROOF_OF_POSSESSION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROOF_OF_POSSESSION_ALLOW_SILENT_REQUESTS => 1
}
