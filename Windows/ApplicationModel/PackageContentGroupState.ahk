#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the staging state of the package content group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstate
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageContentGroupState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotStaged => 0

    /**
     * @type {Integer (Int32)}
     */
    static Queued => 1

    /**
     * @type {Integer (Int32)}
     */
    static Staging => 2

    /**
     * @type {Integer (Int32)}
     */
    static Staged => 3
}
