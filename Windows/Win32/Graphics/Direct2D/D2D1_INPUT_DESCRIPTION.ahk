#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_FILTER.ahk" { D2D1_FILTER }

/**
 * Describes the options that transforms may set on input textures.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_input_description
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INPUT_DESCRIPTION {
    #StructPack 4

    /**
     * The type of filter to apply to the input texture.
     */
    filter : D2D1_FILTER

    /**
     * The mip level to retrieve from the upstream transform, if specified.
     */
    levelOfDetailCount : UInt32

}
