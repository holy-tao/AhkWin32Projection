#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SECPKG_CONTEXT_THUNKS structure contains information about QueryContextAttributes (General) calls to be executed in LSA mode.This structure is used by the SpGetExtendedInformation and SpSetExtendedInformation functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_context_thunks
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CONTEXT_THUNKS {
    #StructPack 4

    /**
     * The number of attributes specified by the <i>Levels</i> parameter.
     */
    InfoLevelCount : UInt32

    /**
     * An array of one or more context attributes. For a complete list of valid values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a>.
     */
    Levels : UInt32[1]

}
