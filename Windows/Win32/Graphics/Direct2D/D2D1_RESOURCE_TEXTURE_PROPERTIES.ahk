#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_CHANNEL_DEPTH.ahk" { D2D1_CHANNEL_DEPTH }
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_FILTER.ahk" { D2D1_FILTER }
#Import ".\D2D1_BUFFER_PRECISION.ahk" { D2D1_BUFFER_PRECISION }

/**
 * Defines a resource texture when the original resource texture is created.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_resource_texture_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_RESOURCE_TEXTURE_PROPERTIES {
    #StructPack 8

    /**
     * The extents of the resource table in each dimension.
     */
    extents : IntPtr

    /**
     * The number of dimensions in the resource texture. This must be a number from 1 to 3.
     */
    dimensions : UInt32

    /**
     * The precision of the resource texture to create.
     */
    bufferPrecision : D2D1_BUFFER_PRECISION

    /**
     * The number of channels in the resource texture.
     */
    channelDepth : D2D1_CHANNEL_DEPTH

    /**
     * The filtering mode to use on the texture.
     */
    filter : D2D1_FILTER

    /**
     * Specifies how pixel values beyond the extent of the texture will be sampled, in every dimension.
     */
    extendModes : D2D1_EXTEND_MODE.Ptr

}
