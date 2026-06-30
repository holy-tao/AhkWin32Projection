#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_FP_BU_STATE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    SensorAttached {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HRESULT}
     */
    CreationResult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
