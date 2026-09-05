#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_RPMB_FRAME_TYPE extends Win32Enum {

    /**
     * Native name: StorageRpmbFrameTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StorageRpmbFrameTypeStandard
     * @type {Integer (Int32)}
     */
    static Standard => 1

    /**
     * Native name: StorageRpmbFrameTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
