#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBackgroundAttachment extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachmentFixed => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachmentScroll => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachmentNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachment_Max => 2147483647
}
