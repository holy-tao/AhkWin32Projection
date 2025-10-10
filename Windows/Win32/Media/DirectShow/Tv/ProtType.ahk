#Requires AutoHotkey v2.0.0 64-bit

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @see https://docs.microsoft.com/windows/win32/api//encdec/ne-encdec-prottype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ProtType{

    /**
     * Copy Free.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_FREE => 1

    /**
     * Copy Once.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_ONCE => 2

    /**
     * Copy Never.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_NEVER => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_NEVER_REALLY => 4

    /**
     * Copy No More.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_NO_MORE => 5

    /**
     * The Copy Control Information (CCI) flag indicates Copy Free, but the Constrained Image Trigger (CIT) bit is set. The content is encrypted.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_FREE_CIT => 6

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_BF => 7

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_CN_RECORDING_STOP => 8

    /**
     * The Copy Control Information (CCI) flag indicates Copy Free, but the Redistribution Control Trigger (RCT) bit is set. The content is encrypted.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_FREE_SECURE => 9

    /**
     * Error or invalid protection scheme. Treat as Copy Never.
     * @type {Integer (Int32)}
     */
    static PROT_COPY_INVALID => 50
}
