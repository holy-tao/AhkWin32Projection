#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_Sizes structure indicates the sizes of important structures used in the message support functions. The QueryContextAttributes (General) function uses this structure.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_sizes
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_Sizes extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the maximum size of the security token used in the authentication exchanges.
     * @type {Integer}
     */
    cbMaxToken {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum size of the signature created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function. This member must be zero if <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> services are not requested or available.
     * @type {Integer}
     */
    cbMaxSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the preferred integral size of the messages. For example, eight indicates that messages should be of size zero mod eight for optimal performance. Messages other than this block size can be padded.
     * @type {Integer}
     */
    cbBlockSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size of the security trailer to be appended to messages. This member should be zero if the relevant services are not requested or available.
     * @type {Integer}
     */
    cbSecurityTrailer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
