#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_FP_BU_STATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    SensorAttached{
        get {
            if(!this.HasProp("__SensorAttached"))
                this.__SensorAttached := BOOL(this.ptr + 0)
            return this.__SensorAttached
        }
    }

    /**
     * @type {HRESULT}
     */
    CreationResult {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
