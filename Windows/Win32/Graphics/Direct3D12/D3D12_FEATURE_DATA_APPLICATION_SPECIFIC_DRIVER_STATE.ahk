#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_APPLICATION_SPECIFIC_DRIVER_STATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Supported{
        get {
            if(!this.HasProp("__Supported"))
                this.__Supported := BOOL(this.ptr + 0)
            return this.__Supported
        }
    }
}
