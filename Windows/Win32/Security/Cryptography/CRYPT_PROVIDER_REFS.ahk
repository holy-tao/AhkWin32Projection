#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_PROVIDER_REF.ahk" { CRYPT_PROVIDER_REF }

/**
 * Contains a collection of provider references.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_provider_refs
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PROVIDER_REFS {
    #StructPack 8

    /**
     * The number of elements in the <b>rgpProviders</b> array.
     */
    cProviders : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/ns-bcrypt-crypt_provider_ref">CRYPT_PROVIDER_REF</a> structure pointers that contain the provider references. The <b>cProviders</b> member contains the number of elements in this array.
     */
    rgpProviders : IntPtr

}
