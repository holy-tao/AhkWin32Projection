#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the format into which the document was serialized.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel_1/ne-xpsobjectmodel_1-xps_document_type
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_DOCUMENT_TYPE extends Win32Enum {

    /**
     * For documents which have yet to be serialized, and whose type is yet to be determined.
     * Native name: XPS_DOCUMENT_TYPE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 1

    /**
     * MSXPS v1.0 document format.
     * Native name: XPS_DOCUMENT_TYPE_XPS
     * @type {Integer (Int32)}
     */
    static XPS => 2

    /**
     * OpenXPS v1.0 document format.
     * Native name: XPS_DOCUMENT_TYPE_OPENXPS
     * @type {Integer (Int32)}
     */
    static OPENXPS => 3
}
