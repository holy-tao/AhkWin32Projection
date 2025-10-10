#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyCreateFileAccess enumeration indicates whether a process has full or restricted access to the IO devices (file, file stream, directory, physical disk, volume, console buffer, tape drive, communications resource, mailslot, and pipe).
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicycreatefileaccess
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyCreateFileAccess{

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
