#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes a known folder's access to a single capability.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.knownfoldersaccessstatus
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class KnownFoldersAccessStatus extends Win32Enum{

    /**
     * System admin disabled access for all users.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 0

    /**
     * App doesn't have the capability declared in the manifest.
     * @type {Integer (Int32)}
     */
    static NotDeclaredByApp => 1

    /**
     * User has denied access and there is no fallback for this location.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * User consent is required, but not yet completed.
     * @type {Integer (Int32)}
     */
    static UserPromptRequired => 3

    /**
     * Access is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 4

    /**
     * Access is allowed but limited to a Per App Subfolder.
     * @type {Integer (Int32)}
     */
    static AllowedPerAppFolder => 5
}
