#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyCreateFileAccess enumeration indicates whether a process has full or restricted access to the IO devices (file, file stream, directory, physical disk, volume, console buffer, tape drive, communications resource, mailslot, and pipe).
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicycreatefileaccess
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyCreateFileAccess {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the process has full access to the IO devices. This value is expected for a desktop application, or for a Desktop Bridge application.
     * @type {Integer (Int32)}
     */
    static AppPolicyCreateFileAccess_Full => 0

    /**
     * Indicates that the process has limited access to the IO devices. This value is expected for a UWP app.
     * @type {Integer (Int32)}
     */
    static AppPolicyCreateFileAccess_Limited => 1
}
