#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_Sizes structure indicates the sizes of important structures used in the message support functions. The QueryContextAttributes (General) function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_sizes
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Sizes {
    #StructPack 4

    /**
     * Specifies the maximum size of the security token used in the authentication exchanges.
     */
    cbMaxToken : UInt32

    /**
     * Specifies the maximum size of the signature created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function. This member must be zero if <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> services are not requested or available.
     */
    cbMaxSignature : UInt32

    /**
     * Specifies the preferred integral size of the messages. For example, eight indicates that messages should be of size zero mod eight for optimal performance. Messages other than this block size can be padded.
     */
    cbBlockSize : UInt32

    /**
     * Size of the security trailer to be appended to messages. This member should be zero if the relevant services are not requested or available.
     */
    cbSecurityTrailer : UInt32

}
