#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\..\Graphics\Dxgi\Common\DXGI_ALPHA_MODE.ahk" { DXGI_ALPHA_MODE }

/**
 * Represents information about the bitmap stored in IBitmapData.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-bitmapdescription
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct BitmapDescription {
    #StructPack 4

    /**
     * The width of the bitmap.
     */
    Width : UInt32

    /**
     * The height of the bitmap.
     */
    Height : UInt32

    /**
     * The format of the bitmap.
     */
    Format : DXGI_FORMAT

    /**
     * The alpha mode of the bitmap.
     */
    AlphaMode : DXGI_ALPHA_MODE

}
