#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class OPEN_FILENAME_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_OVERWRITEPROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_HIDEREADONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NOCHANGEDIR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_SHOWHELP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ENABLEHOOK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ENABLETEMPLATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ENABLETEMPLATEHANDLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NOVALIDATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ALLOWMULTISELECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_EXTENSIONDIFFERENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_PATHMUSTEXIST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_FILEMUSTEXIST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_CREATEPROMPT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_SHAREAWARE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NOREADONLYRETURN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NOTESTFILECREATE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NONETWORKBUTTON => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NOLONGNAMES => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_EXPLORER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_NODEREFERENCELINKS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_LONGNAMES => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ENABLEINCLUDENOTIFY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_ENABLESIZING => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_DONTADDTORECENT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_FORCESHOWHIDDEN => 268435456
}
