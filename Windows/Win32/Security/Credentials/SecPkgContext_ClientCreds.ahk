#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies client credentials when calling the QueryContextAttributes (CredSSP) function.
 * @see https://learn.microsoft.com/windows/win32/api/credssp/ns-credssp-secpkgcontext_clientcreds
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SecPkgContext_ClientCreds {
    #StructPack 8

    /**
     * The size, in characters, of the <b>AuthBuffer</b> buffer.
     */
    AuthBufferLen : UInt32

    /**
     * A pointer to a buffer that represents the client credentials.
     */
    AuthBuffer : IntPtr

}
