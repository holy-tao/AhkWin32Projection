#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D2D1_CHANNEL_DEPTH.ahk
#Include .\D2D1_FILTER.ahk
#Include .\D2D1_EXTEND_MODE.ahk
#Include .\D2D1_BUFFER_PRECISION.ahk

/**
 * Defines a resource texture when the original resource texture is created.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_resource_texture_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_RESOURCE_TEXTURE_PROPERTIES extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The extents of the resource table in each dimension.
     * @type {Pointer<Integer>}
     */
    extents {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of dimensions in the resource texture. This must be a number from 1 to 3.
     * @type {Integer}
     */
    dimensions {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The precision of the resource texture to create.
     * @type {D2D1_BUFFER_PRECISION}
     */
    bufferPrecision {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The number of channels in the resource texture.
     * @type {D2D1_CHANNEL_DEPTH}
     */
    channelDepth {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The filtering mode to use on the texture.
     * @type {D2D1_FILTER}
     */
    filter {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies how pixel values beyond the extent of the texture will be sampled, in every dimension.
     * @type {Pointer<D2D1_EXTEND_MODE>}
     */
    extendModes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
