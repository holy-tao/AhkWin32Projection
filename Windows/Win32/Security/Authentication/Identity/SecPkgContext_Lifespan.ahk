#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_Lifespan structure indicates the life span of a security context. The QueryContextAttributes (General) function uses this structure.
 * @remarks
 * It is recommended that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> always return these values in local time.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_lifespan
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_Lifespan {
    #StructPack 8

    /**
     * Time at which the context was established.
     */
    tsStart : Int64

    /**
     * Time at which the context will expire.
     */
    tsExpiry : Int64

}
