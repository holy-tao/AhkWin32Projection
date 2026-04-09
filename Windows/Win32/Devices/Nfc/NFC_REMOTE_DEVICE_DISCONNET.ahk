#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_RELEASE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_REMOTE_DEVICE_DISCONNET extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hRemoteDev {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NFC_RELEASE_TYPE}
     */
    eReleaseType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
