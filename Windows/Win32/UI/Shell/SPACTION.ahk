#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes an action being performed that requires progress to be shown to the user using an IActionProgress interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-spaction
 * @namespace Windows.Win32.UI.Shell
 */
class SPACTION extends Win32Enum {

    /**
     * No action is being performed.
     * Native name: SPACTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Files are being moved.
     * Native name: SPACTION_MOVING
     * @type {Integer (Int32)}
     */
    static MOVING => 1

    /**
     * Files are being copied.
     * Native name: SPACTION_COPYING
     * @type {Integer (Int32)}
     */
    static COPYING => 2

    /**
     * Files are being deleted.
     * Native name: SPACTION_RECYCLING
     * @type {Integer (Int32)}
     */
    static RECYCLING => 3

    /**
     * A set of attributes are being applied to files.
     * Native name: SPACTION_APPLYINGATTRIBS
     * @type {Integer (Int32)}
     */
    static APPLYINGATTRIBS => 4

    /**
     * A file is being downloaded from a remote source.
     * Native name: SPACTION_DOWNLOADING
     * @type {Integer (Int32)}
     */
    static DOWNLOADING => 5

    /**
     * An Internet search is being performed.
     * Native name: SPACTION_SEARCHING_INTERNET
     * @type {Integer (Int32)}
     */
    static SEARCHING_INTERNET => 6

    /**
     * A calculation is being performed.
     * Native name: SPACTION_CALCULATING
     * @type {Integer (Int32)}
     */
    static CALCULATING => 7

    /**
     * A file is being uploaded to a remote source.
     * Native name: SPACTION_UPLOADING
     * @type {Integer (Int32)}
     */
    static UPLOADING => 8

    /**
     * A local search is being performed.
     * Native name: SPACTION_SEARCHING_FILES
     * @type {Integer (Int32)}
     */
    static SEARCHING_FILES => 9

    /**
     * <b>Windows Vista and later</b>. A deletion is being performed.
     * Native name: SPACTION_DELETING
     * @type {Integer (Int32)}
     */
    static DELETING => 10

    /**
     * <b>Windows Vista and later</b>. A renaming action is being performed.
     * Native name: SPACTION_RENAMING
     * @type {Integer (Int32)}
     */
    static RENAMING => 11

    /**
     * <b>Windows Vista and later</b>. A formatting action is being performed.
     * Native name: SPACTION_FORMATTING
     * @type {Integer (Int32)}
     */
    static FORMATTING => 12

    /**
     * <b>Windows 7 and later</b>. A copy or move action is being performed.
     * Native name: SPACTION_COPY_MOVING
     * @type {Integer (Int32)}
     */
    static COPY_MOVING => 13
}
