#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS20 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ComputeOnlyWriteWatchSupported{
        get {
            if(!this.HasProp("__ComputeOnlyWriteWatchSupported"))
                this.__ComputeOnlyWriteWatchSupported := BOOL(this.ptr + 0)
            return this.__ComputeOnlyWriteWatchSupported
        }
    }

    /**
     * @type {Integer}
     */
    RecreateAtTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
