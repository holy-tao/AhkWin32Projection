#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used with the FILE_IO_PRIORITY_HINT_INFO structure to specify the priority hint for a file I/O operation.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-priority_hint
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class PRIORITY_HINT extends Win32Enum{

    /**
     * The lowest possible priority hint level. The system uses this value for background I/O operations.
     * @type {Integer (Int32)}
     */
    static IoPriorityHintVeryLow => 0

    /**
     * A low-priority hint level.
     * @type {Integer (Int32)}
     */
    static IoPriorityHintLow => 1

    /**
     * A normal-priority hint level. This value is the default setting for an I/O operation.
     * @type {Integer (Int32)}
     */
    static IoPriorityHintNormal => 2

    /**
     * This value is used for validation. Supported values are less than this value.
     * @type {Integer (Int32)}
     */
    static MaximumIoPriorityHintType => 3
}
