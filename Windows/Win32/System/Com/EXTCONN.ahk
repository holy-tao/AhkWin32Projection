#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EXTCONN (objidlbase.h) enumeration specifies the type of external connection existing on an embedded object.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-extconn
 * @namespace Windows.Win32.System.Com
 */
class EXTCONN extends Win32Enum {

    /**
     * The external connection is a link. If this value is specified, the external connection must keep the object alive until all strong external connections are cleared through <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iexternalconnection-releaseconnection">IExternalConnection::ReleaseConnection</a>.
     * Native name: EXTCONN_STRONG
     * @type {Integer (Int32)}
     */
    static STRONG => 1

    /**
     * This value is not used.
     * Native name: EXTCONN_WEAK
     * @type {Integer (Int32)}
     */
    static WEAK => 2

    /**
     * This value is not used.
     * Native name: EXTCONN_CALLABLE
     * @type {Integer (Int32)}
     */
    static CALLABLE => 4
}
