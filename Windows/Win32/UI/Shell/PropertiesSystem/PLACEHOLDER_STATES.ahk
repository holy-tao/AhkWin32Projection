#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the states that a placeholder file can have. Retrieve this value through the System.FilePlaceholderStatus (PKEY_FilePlaceholderStatus) property.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-placeholder_states
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PLACEHOLDER_STATES{

    /**
     * None of the other states apply at this time.
     * @type {Integer (Int32)}
     */
    static PS_NONE => 0

    /**
     * May already be or eventually will be available offline.
     * @type {Integer (Int32)}
     */
    static PS_MARKED_FOR_OFFLINE_AVAILABILITY => 1

    /**
     * The primary stream has been made fully available.
     * @type {Integer (Int32)}
     */
    static PS_FULL_PRIMARY_STREAM_AVAILABLE => 2

    /**
     * The file is accessible through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function, without requesting the opening of reparse points.
     * @type {Integer (Int32)}
     */
    static PS_CREATE_FILE_ACCESSIBLE => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PS_CLOUDFILE_PLACEHOLDER => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PS_DEFAULT => 7

    /**
     * A bitmask value for all valid PLACEHOLDER_STATES flags.
     * @type {Integer (Int32)}
     */
    static PS_ALL => 15
}
