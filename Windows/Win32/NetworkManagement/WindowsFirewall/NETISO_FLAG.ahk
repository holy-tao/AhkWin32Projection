#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether binaries should be returned for app containers.
 * @remarks
 * 
 * By default, binaries are not returned. <b>NETISO_FLAG_FORCE_COMPUTE_BINARIES</b> must be set in order for these to be returned.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ne-networkisolation-netiso_flag
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETISO_FLAG{

    /**
     * Specifies that all binaries will be computed before the app container is returned.
 * 
 * This flag should be set if the caller requires up-to-date and complete information on app container binaries. If this flag is not set, returned data may be stale or incomplete.
     * @type {Integer (Int32)}
     */
    static NETISO_FLAG_FORCE_COMPUTE_BINARIES => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NETISO_FLAG_MAX => 2
}
