#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used for time stamping.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_time_stamp_request_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIME_STAMP_REQUEST_INFO {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that specifies the desired format of the time stamp, usually UTC.
     */
    pszTimeStampAlgorithm : PSTR

    /**
     * The OID of the Content Type of the content, usually DATA.
     */
    pszContentType : PSTR

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains the encoded signature bits of the material being time stamped.
     */
    Content : CRYPT_INTEGER_BLOB

    /**
     * The number of elements in the <b>rgAttribute</b> array.
     */
    cAttribute : UInt32

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding an encoded attribute.
     */
    rgAttribute : CRYPT_ATTRIBUTE.Ptr

}
