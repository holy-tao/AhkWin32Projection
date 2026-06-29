#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_KeyingMaterial structure.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_keyingmaterial
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_KeyingMaterial {
    #StructPack 8

    /**
     * The length, in bytes, of the keying material to be exported. Must be greater than zero.
     */
    cbKeyingMaterial : UInt32

    /**
     * A pointer to the buffer containing the exported keying material. After use, deallocate the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a>.
     */
    pbKeyingMaterial : IntPtr

}
