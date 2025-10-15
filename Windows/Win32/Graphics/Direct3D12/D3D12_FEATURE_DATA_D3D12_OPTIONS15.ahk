#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS15 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    TriangleFanSupported{
        get {
            if(!this.HasProp("__TriangleFanSupported"))
                this.__TriangleFanSupported := BOOL(this.ptr + 0)
            return this.__TriangleFanSupported
        }
    }

    /**
     * @type {BOOL}
     */
    DynamicIndexBufferStripCutSupported{
        get {
            if(!this.HasProp("__DynamicIndexBufferStripCutSupported"))
                this.__DynamicIndexBufferStripCutSupported := BOOL(this.ptr + 4)
            return this.__DynamicIndexBufferStripCutSupported
        }
    }
}
