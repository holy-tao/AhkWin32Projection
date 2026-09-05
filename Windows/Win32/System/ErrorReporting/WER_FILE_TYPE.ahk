#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_FILE_TYPE extends Win32Enum {

    /**
     * Native name: WerFileTypeMicrodump
     * @type {Integer (Int32)}
     */
    static Microdump => 1

    /**
     * Native name: WerFileTypeMinidump
     * @type {Integer (Int32)}
     */
    static Minidump => 2

    /**
     * Native name: WerFileTypeHeapdump
     * @type {Integer (Int32)}
     */
    static Heapdump => 3

    /**
     * Native name: WerFileTypeUserDocument
     * @type {Integer (Int32)}
     */
    static UserDocument => 4

    /**
     * Native name: WerFileTypeOther
     * @type {Integer (Int32)}
     */
    static Other => 5

    /**
     * Native name: WerFileTypeTriagedump
     * @type {Integer (Int32)}
     */
    static Triagedump => 6

    /**
     * Native name: WerFileTypeCustomDump
     * @type {Integer (Int32)}
     */
    static CustomDump => 7

    /**
     * Native name: WerFileTypeAuxiliaryDump
     * @type {Integer (Int32)}
     */
    static AuxiliaryDump => 8

    /**
     * Native name: WerFileTypeEtlTrace
     * @type {Integer (Int32)}
     */
    static EtlTrace => 9

    /**
     * Native name: WerFileTypeAuxiliaryHeapDump
     * @type {Integer (Int32)}
     */
    static AuxiliaryHeapDump => 10

    /**
     * Native name: WerFileTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 11
}
