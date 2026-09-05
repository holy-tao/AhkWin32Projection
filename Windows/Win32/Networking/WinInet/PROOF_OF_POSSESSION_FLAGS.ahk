#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class PROOF_OF_POSSESSION_FLAGS extends Win32Enum {

    /**
     * Native name: PROOF_OF_POSSESSION_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0

    /**
     * Native name: PROOF_OF_POSSESSION_ALLOW_SILENT_REQUESTS
     * @type {Integer (UInt32)}
     */
    static ALLOW_SILENT_REQUESTS => 1
}
