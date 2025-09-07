#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the type of COM security descriptor to get when calling CoGetSystemSecurityPermissions.
 * @see https://learn.microsoft.com/windows/win32/api/objbase/ne-objbase-comsd
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class COMSD{

    /**
     * Machine-wide launch permissions.
     * @type {Integer (Int32)}
     */
    static SD_LAUNCHPERMISSIONS => 0

    /**
     * Machine-wide access permissions.
     * @type {Integer (Int32)}
     */
    static SD_ACCESSPERMISSIONS => 1

    /**
     * Machine-wide launch limits.
     * @type {Integer (Int32)}
     */
    static SD_LAUNCHRESTRICTIONS => 2

    /**
     * Machine-wide access limits.
     * @type {Integer (Int32)}
     */
    static SD_ACCESSRESTRICTIONS => 3
}
