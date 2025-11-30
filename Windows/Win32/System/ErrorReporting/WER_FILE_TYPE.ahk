#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_FILE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeMicrodump => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeMinidump => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeHeapdump => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeUserDocument => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeOther => 5

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeTriagedump => 6

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeCustomDump => 7

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeAuxiliaryDump => 8

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeEtlTrace => 9

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeAuxiliaryHeapDump => 10

    /**
     * @type {Integer (Int32)}
     */
    static WerFileTypeMax => 11
}
