#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the types of enumeration flags.
 * @remarks
 * <div class="alert"><b>Note</b>  UserEnumeration should not be used. No namespaces are compiled for a particular user, they are all compiled for the machine as an entity.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceenumerationflags
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmNamespaceEnumerationFlags extends Win32Enum{

    /**
     * Describes a shared enumeration. It enumerates all namespaces that have been compiled for the machine space.
     * @type {Integer (Int32)}
     */
    static SharedEnumeration => 1

    /**
     * Describes a user-specific  enumeration. It enumerates the namespaces that have been compiled for a specific user.
     * @type {Integer (Int32)}
     */
    static UserEnumeration => 2

    /**
     * A logical "OR" of shared and user enumeration.
     * @type {Integer (Int32)}
     */
    static AllEnumeration => 3
}
