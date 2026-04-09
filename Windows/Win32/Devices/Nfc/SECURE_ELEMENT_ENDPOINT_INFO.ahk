#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_ENDPOINT_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    guidSecureElementId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SECURE_ELEMENT_TYPE}
     */
    eSecureElementType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
