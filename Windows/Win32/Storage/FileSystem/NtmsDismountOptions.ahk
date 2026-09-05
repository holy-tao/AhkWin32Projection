#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsDismountOptions extends Win32Enum {

    /**
     * Native name: NTMS_DISMOUNT_DEFERRED
     * @type {Integer (Int32)}
     */
    static DEFERRED => 1

    /**
     * Native name: NTMS_DISMOUNT_IMMEDIATE
     * @type {Integer (Int32)}
     */
    static IMMEDIATE => 2
}
