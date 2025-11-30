#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CREATE_FILE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CreateFileTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static CreateFileTypeNamedPipe => 1

    /**
     * @type {Integer (Int32)}
     */
    static CreateFileTypeMailslot => 2
}
