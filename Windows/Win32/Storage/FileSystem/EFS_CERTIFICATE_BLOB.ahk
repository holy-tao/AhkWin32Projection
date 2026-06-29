#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_certificate_blob
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_CERTIFICATE_BLOB {
    #StructPack 8

    dwCertEncodingType : UInt32

    /**
     * The number of bytes in the <b>pbData</b> buffer.
     */
    cbData : UInt32

    /**
     * The binary certificate. The  
     *       <b>dwCertEncodingType</b> member specifies the format for this certificate.
     */
    pbData : IntPtr

}
