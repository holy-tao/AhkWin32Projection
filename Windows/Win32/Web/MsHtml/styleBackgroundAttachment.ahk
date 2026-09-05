#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackgroundAttachment extends Win32Enum {

    /**
     * Native name: styleBackgroundAttachmentFixed
     * @type {Integer (Int32)}
     */
    static Fixed => 0

    /**
     * Native name: styleBackgroundAttachmentScroll
     * @type {Integer (Int32)}
     */
    static Scroll => 1

    /**
     * Native name: styleBackgroundAttachmentNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleBackgroundAttachment_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
