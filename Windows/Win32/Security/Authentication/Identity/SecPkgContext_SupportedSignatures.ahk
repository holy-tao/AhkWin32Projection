#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the signature algorithms supported by an Schannel connection.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_supportedsignatures
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SupportedSignatures {
    #StructPack 8

    /**
     * The number of elements in the <i>pSignatureAndHashAlgorithms</i> array.
     */
    cSignatureAndHashAlgorithms : UInt16

    /**
     * An array of values that specify supported algorithms. These values are in the following format.
     */
    pSignatureAndHashAlgorithms : IntPtr

}
