#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the debugging level of an ID2D1Factory object.
 * @remarks
 * 
 * To enable debugging, you must install the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2ddebuglayer-overview">Direct2D Debug Layer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_factory_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FACTORY_OPTIONS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_debug_level">D2D1_DEBUG_LEVEL</a></b>
     * 
     * The debugging level of the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> object.
     * @type {Integer}
     */
    debugLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
