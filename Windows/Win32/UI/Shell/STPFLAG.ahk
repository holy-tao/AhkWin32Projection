#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the ITaskbarList4::SetTabProperties method to specify tab properties.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-stpflag
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class STPFLAG{

    /**
     * No specific property values are specified. The default behavior is used: the tab window provides a thumbnail and peek image, either live or static as appropriate.
     * @type {Integer (Int32)}
     */
    static STPF_NONE => 0

    /**
     * Always use the thumbnail provided by the main application frame window rather than a thumbnail provided by the individual tab window. Do not combine this value with STPF_USEAPPTHUMBNAILWHENACTIVE; doing so will result in an error.
     * @type {Integer (Int32)}
     */
    static STPF_USEAPPTHUMBNAILALWAYS => 1

    /**
     * When the application tab is active and a live representation of its window is available, use the main application's frame window thumbnail. At other times, use the tab window thumbnail. Do not combine this value with STPF_USEAPPTHUMBNAILALWAYS; doing so will result in an error.
     * @type {Integer (Int32)}
     */
    static STPF_USEAPPTHUMBNAILWHENACTIVE => 2

    /**
     * Always use the peek image provided by the main application frame window rather than a peek image provided by the individual tab window. Do not combine this value with STPF_USEAPPPEEKWHENACTIVE; doing so will result in an error.
     * @type {Integer (Int32)}
     */
    static STPF_USEAPPPEEKALWAYS => 4

    /**
     * When the application tab is active and a live representation of its window is available, show the main application frame in the peek feature. At other times, use the tab window. Do not combine this value with STPF_USEAPPPEEKALWAYS; doing so will result in an error.
     * @type {Integer (Int32)}
     */
    static STPF_USEAPPPEEKWHENACTIVE => 8
}
