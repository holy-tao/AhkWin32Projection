#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class OpenServiceActivityContentType extends Win32Enum {

    /**
     * Native name: ActivityContentNone
     * @type {Integer (Int32)}
     */
    static None => -1

    /**
     * Native name: ActivityContentDocument
     * @type {Integer (Int32)}
     */
    static Document => 0

    /**
     * Native name: ActivityContentSelection
     * @type {Integer (Int32)}
     */
    static Selection => 1

    /**
     * Native name: ActivityContentLink
     * @type {Integer (Int32)}
     */
    static Link => 2

    /**
     * Native name: ActivityContentCount
     * @type {Integer (Int32)}
     */
    static Count => 3
}
