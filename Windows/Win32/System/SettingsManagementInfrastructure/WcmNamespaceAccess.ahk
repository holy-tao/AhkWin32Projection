#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the options passed to the ISettingsEngine::GetNamespace method to choose how the namespace must be accessed.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceaccess
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct WcmNamespaceAccess {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
