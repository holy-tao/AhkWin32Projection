#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class StorageKind extends Win32Enum {

    /**
     * Native name: StorageUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageRegister
     * @type {Integer (Int32)}
     */
    static Register => 1

    /**
     * Native name: StorageRegisterRelative
     * @type {Integer (Int32)}
     */
    static RegisterRelative => 2

    /**
     * Native name: StorageRegisterRelativeIndirect
     * @type {Integer (Int32)}
     */
    static RegisterRelativeIndirect => 3
}
