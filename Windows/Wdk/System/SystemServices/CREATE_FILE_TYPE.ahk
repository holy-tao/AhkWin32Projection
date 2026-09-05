#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class CREATE_FILE_TYPE extends Win32Enum {

    /**
     * Native name: CreateFileTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: CreateFileTypeNamedPipe
     * @type {Integer (Int32)}
     */
    static NamedPipe => 1

    /**
     * Native name: CreateFileTypeMailslot
     * @type {Integer (Int32)}
     */
    static Mailslot => 2
}
