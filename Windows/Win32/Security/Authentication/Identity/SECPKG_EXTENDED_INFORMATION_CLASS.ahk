#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SECPKG_EXTENDED_INFORMATION_CLASS enumeration describes the type of information to set or get for a security package.This enumeration is used by the SpGetExtendedInformation and SpSetExtendedInformation functions.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ne-ntsecpkg-secpkg_extended_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_EXTENDED_INFORMATION_CLASS{

    /**
     * GSS OID information used to identify the security package in GSS-compatible negotiations.
     * @type {Integer (Int32)}
     */
    static SecpkgGssInfo => 1

    /**
     * Identifies the calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function that are handled in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) process space (LSA mode) rather than being handled in the client process space (user mode).
     * @type {Integer (Int32)}
     */
    static SecpkgContextThunks => 2

    /**
     * The mutual authentication level used in the system. This value is valid for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spgetextendedinformationfn">SpGetExtendedInformation</a> function only.
     * @type {Integer (Int32)}
     */
    static SecpkgMutualAuthLevel => 3

    /**
     * Identifies that the WOW client supports a 32-bit version. Otherwise, the WOW client expects the process to run in 64-bit mode. LSA operations are done by the 64-bit version. When the security context is handed back to the client,  the 32-bit WOW-aware version is loaded and hands it any information from the 64-bit version.
     * @type {Integer (Int32)}
     */
    static SecpkgWowClientDll => 4

    /**
     * Identifies that extra object identifiers (OIDs) are available.
     * @type {Integer (Int32)}
     */
    static SecpkgExtraOids => 5

    /**
     * The end value for the enumeration. This value is not a valid parameter value.
     * @type {Integer (Int32)}
     */
    static SecpkgMaxInfo => 6

    /**
     * Identifies the SPNego information for the security package.
 * 
 * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This constant is not available.
     * @type {Integer (Int32)}
     */
    static SecpkgNego2Info => 7
}
