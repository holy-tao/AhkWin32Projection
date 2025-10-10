#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the options passed to the ISettingsEngine::GetNamespace method to choose how the namespace must be accessed.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/ne-wcmconfig-wcmnamespaceaccess
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmNamespaceAccess{

    /**
     * Request read-only access.
     * @type {Integer (Int32)}
     */
    static ReadOnlyAccess => 1

    /**
     * Request read and write access.
     * @type {Integer (Int32)}
     */
    static ReadWriteAccess => 2
}
