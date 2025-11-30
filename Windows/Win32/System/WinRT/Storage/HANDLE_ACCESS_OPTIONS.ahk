#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the level of access that a handle has on files.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/ne-windowsstoragecom-handle_access_options
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class HANDLE_ACCESS_OPTIONS extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static HAO_NONE => 0

    /**
     * The handle can be used to read file attributes.
     * @type {Integer (Int32)}
     */
    static HAO_READ_ATTRIBUTES => 128

    /**
     * The handle can be used to read the file.
     * @type {Integer (Int32)}
     */
    static HAO_READ => 1179785

    /**
     * The handle can be used to write to the file.
     * @type {Integer (Int32)}
     */
    static HAO_WRITE => 1179926

    /**
     * The handle can be used to delete the file.
     * @type {Integer (Int32)}
     */
    static HAO_DELETE => 65536
}
