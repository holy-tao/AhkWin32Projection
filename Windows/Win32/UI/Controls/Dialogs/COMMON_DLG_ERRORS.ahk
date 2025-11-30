#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class COMMON_DLG_ERRORS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_DIALOGFAILURE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_GENERALCODES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_STRUCTSIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_INITIALIZATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_NOTEMPLATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_NOHINSTANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_LOADSTRFAILURE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_FINDRESFAILURE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_LOADRESFAILURE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_LOCKRESFAILURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_MEMALLOCFAILURE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_MEMLOCKFAILURE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_NOHOOK => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CDERR_REGISTERMSGFAIL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_PRINTERCODES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_SETUPFAILURE => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_PARSEFAILURE => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_RETDEFFAILURE => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_LOADDRVFAILURE => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_GETDEVMODEFAIL => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_INITFAILURE => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_NODEVICES => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_NODEFAULTPRN => 4104

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_DNDMMISMATCH => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_CREATEICFAILURE => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_PRINTERNOTFOUND => 4107

    /**
     * @type {Integer (UInt32)}
     */
    static PDERR_DEFAULTDIFFERENT => 4108

    /**
     * @type {Integer (UInt32)}
     */
    static CFERR_CHOOSEFONTCODES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CFERR_NOFONTS => 8193

    /**
     * @type {Integer (UInt32)}
     */
    static CFERR_MAXLESSTHANMIN => 8194

    /**
     * @type {Integer (UInt32)}
     */
    static FNERR_FILENAMECODES => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static FNERR_SUBCLASSFAILURE => 12289

    /**
     * @type {Integer (UInt32)}
     */
    static FNERR_INVALIDFILENAME => 12290

    /**
     * @type {Integer (UInt32)}
     */
    static FNERR_BUFFERTOOSMALL => 12291

    /**
     * @type {Integer (UInt32)}
     */
    static FRERR_FINDREPLACECODES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FRERR_BUFFERLENGTHZERO => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static CCERR_CHOOSECOLORCODES => 20480
}
