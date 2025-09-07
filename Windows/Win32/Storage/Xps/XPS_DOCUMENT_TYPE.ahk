#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the format into which the document was serialized.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_DOCUMENT_TYPE{

    /**
     * For documents which have yet to be serialized, and whose type is yet to be determined.
     * @type {Integer (Int32)}
     */
    static XPS_DOCUMENT_TYPE_UNSPECIFIED => 1

    /**
     * MSXPS v1.0 document format.
     * @type {Integer (Int32)}
     */
    static XPS_DOCUMENT_TYPE_XPS => 2

    /**
     * OpenXPS v1.0 document format.
     * @type {Integer (Int32)}
     */
    static XPS_DOCUMENT_TYPE_OPENXPS => 3
}
