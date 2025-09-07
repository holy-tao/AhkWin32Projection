#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRMSECURITYPROVIDERTYPE enumeration specifies the type of secure DRM environment used.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmsecurityprovidertype
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMSECURITYPROVIDERTYPE{

    /**
     * Software-level security, using a lockbox.
     * @type {Integer (Int32)}
     */
    static DRMSECURITYPROVIDERTYPE_SOFTWARESECREP => 0
}
