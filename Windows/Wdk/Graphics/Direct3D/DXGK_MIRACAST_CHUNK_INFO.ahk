#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGK_MIRACAST_CHUNK_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_MIRACAST_CHUNK_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {DXGK_MIRACAST_CHUNK_TYPE}
     */
    ChunkType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    ChunkId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ProcessingTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    EncodeRate {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
