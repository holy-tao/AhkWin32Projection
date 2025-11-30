#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class OpenServiceActivityContentType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentNone => -1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentDocument => 0

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentSelection => 1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentLink => 2

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentCount => 3
}
