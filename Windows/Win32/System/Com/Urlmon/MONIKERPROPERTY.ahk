#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class MONIKERPROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MIMETYPEPROP => 0

    /**
     * @type {Integer (Int32)}
     */
    static USE_SRC_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLASSIDPROP => 2

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEDDOWNLOADPROP => 3

    /**
     * @type {Integer (Int32)}
     */
    static POPUPLEVELPROP => 4
}
