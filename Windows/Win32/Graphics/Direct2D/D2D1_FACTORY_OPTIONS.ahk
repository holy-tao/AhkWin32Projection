#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_DEBUG_LEVEL.ahk" { D2D1_DEBUG_LEVEL }

/**
 * Contains the debugging level of an ID2D1Factory object.
 * @remarks
 * To enable debugging, you must install the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2ddebuglayer-overview">Direct2D Debug Layer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_factory_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_FACTORY_OPTIONS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_debug_level">D2D1_DEBUG_LEVEL</a></b>
     * 
     * The debugging level of the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> object.
     */
    debugLevel : D2D1_DEBUG_LEVEL

}
