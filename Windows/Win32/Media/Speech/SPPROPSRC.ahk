#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPROPSRC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPPROPSRC_RECO_INST => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPPROPSRC_RECO_CTX => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPPROPSRC_RECO_GRAMMAR => 2
}
