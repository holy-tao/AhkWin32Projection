#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_RPMB_COMMAND_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbProgramAuthKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbQueryWriteCounter => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedWrite => 3

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedRead => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbReadResultRequest => 5

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedDeviceConfigWrite => 6

    /**
     * @type {Integer (Int32)}
     */
    static StorRpmbAuthenticatedDeviceConfigRead => 7
}
