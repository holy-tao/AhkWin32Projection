#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a buffer that points to an encoded certificate.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ns-msxml6-xhr_cert
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct XHR_CERT {
    #StructPack 8

    /**
     * The size, in bytes, of the encoded certificate.
     */
    cbCert : UInt32

    /**
     * A pointer to the buffer that contains the encoded certificate.
     */
    pbCert : IntPtr

}
