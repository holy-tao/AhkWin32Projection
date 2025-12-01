#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes an action being performed that requires progress to be shown to the user using an IActionProgress interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-spaction
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SPACTION extends Win32Enum{

    /**
     * No action is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_NONE => 0

    /**
     * Files are being moved.
     * @type {Integer (Int32)}
     */
    static SPACTION_MOVING => 1

    /**
     * Files are being copied.
     * @type {Integer (Int32)}
     */
    static SPACTION_COPYING => 2

    /**
     * Files are being deleted.
     * @type {Integer (Int32)}
     */
    static SPACTION_RECYCLING => 3

    /**
     * A set of attributes are being applied to files.
     * @type {Integer (Int32)}
     */
    static SPACTION_APPLYINGATTRIBS => 4

    /**
     * A file is being downloaded from a remote source.
     * @type {Integer (Int32)}
     */
    static SPACTION_DOWNLOADING => 5

    /**
     * An Internet search is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_SEARCHING_INTERNET => 6

    /**
     * A calculation is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_CALCULATING => 7

    /**
     * A file is being uploaded to a remote source.
     * @type {Integer (Int32)}
     */
    static SPACTION_UPLOADING => 8

    /**
     * A local search is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_SEARCHING_FILES => 9

    /**
     * <b>Windows Vista and later</b>. A deletion is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_DELETING => 10

    /**
     * <b>Windows Vista and later</b>. A renaming action is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_RENAMING => 11

    /**
     * <b>Windows Vista and later</b>. A formatting action is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_FORMATTING => 12

    /**
     * <b>Windows 7 and later</b>. A copy or move action is being performed.
     * @type {Integer (Int32)}
     */
    static SPACTION_COPY_MOVING => 13
}
