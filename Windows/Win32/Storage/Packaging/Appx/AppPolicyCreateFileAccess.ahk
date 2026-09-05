#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyCreateFileAccess enumeration indicates whether a process has full or restricted access to the IO devices (file, file stream, directory, physical disk, volume, console buffer, tape drive, communications resource, mailslot, and pipe).
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicycreatefileaccess
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AppPolicyCreateFileAccess extends Win32Enum {

    /**
     * Indicates that the process has full access to the IO devices. This value is expected for a desktop application, or for a Desktop Bridge application.
     * Native name: AppPolicyCreateFileAccess_Full
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Indicates that the process has limited access to the IO devices. This value is expected for a UWP app.
     * Native name: AppPolicyCreateFileAccess_Limited
     * @type {Integer (Int32)}
     */
    static Limited => 1
}
