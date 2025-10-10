#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of external connection existing on an embedded object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-extconn
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class EXTCONN{

    /**
     * The external connection is a link. If this value is specified, the external connection must keep the object alive until all strong external connections are cleared through <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iexternalconnection-releaseconnection">IExternalConnection::ReleaseConnection</a>.
     * @type {Integer (Int32)}
     */
    static EXTCONN_STRONG => 1

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static EXTCONN_WEAK => 2

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static EXTCONN_CALLABLE => 4
}
