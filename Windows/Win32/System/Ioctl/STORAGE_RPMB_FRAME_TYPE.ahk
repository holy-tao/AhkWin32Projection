#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_RPMB_FRAME_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorageRpmbFrameTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageRpmbFrameTypeStandard => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageRpmbFrameTypeMax => 2
}
