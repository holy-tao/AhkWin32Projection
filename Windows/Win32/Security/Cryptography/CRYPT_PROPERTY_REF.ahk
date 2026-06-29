#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a CNG context property.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_property_ref
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PROPERTY_REF {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the property.
     */
    pszProperty : PWSTR

    /**
     * The size, in bytes, of the <b>pbValue</b> buffer.
     */
    cbValue : UInt32

    /**
     * A pointer to a memory buffer that contains the value of the property. The format and type of this data depend on the property.
     */
    pbValue : IntPtr

}
