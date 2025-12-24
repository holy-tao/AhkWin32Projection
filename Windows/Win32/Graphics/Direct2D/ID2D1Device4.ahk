#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext4.ahk
#Include .\ID2D1Device3.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device3 interface. It also enables the creation of ID2D1DeviceContext4 objects.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1device4
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device4 extends ID2D1Device3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Device4
     * @type {Guid}
     */
    static IID => Guid("{d7bdb159-5683-4a46-bc9c-72dc720b858b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext", "SetMaximumColorGlyphCacheMemory", "GetMaximumColorGlyphCacheMemory"]

    /**
     * Creates a new ID2D1DeviceContext4 from this Direct2D device.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext4} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1devicecontext4">ID2D1DeviceContext4</a>**</b>
     * 
     * When this method returns, contains a pointer to the new device context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device4-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(16, this, "int", options, "ptr*", &deviceContext4 := 0, "HRESULT")
        return ID2D1DeviceContext4(deviceContext4)
    }

    /**
     * Sets the maximum capacity of the color glyph cache.
     * @remarks
     * 
     * The color glyph cache is used to store color bitmap glyphs and SVG glyphs, enabling faster performance if the same
     *       glyphs are needed again. The capacity determines the amount of memory that D2D may use to store glyphs that the application does not already reference. If the
     *       application references a glyph using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getcolorbitmapglyphimage">GetColorBitmapGlyphImage</a> or
     *       <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getsvgglyphimage">GetSvgGlyphImage</a>, after it has been evicted, this
     *       glyph does not count toward the cache capacity.
     * 
     * 
     * @param {Integer} maximumInBytes Type: <b>UINT64</b>
     * 
     * The maximum capacity of the color glyph cache.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device4-setmaximumcolorglyphcachememory
     */
    SetMaximumColorGlyphCacheMemory(maximumInBytes) {
        ComCall(17, this, "uint", maximumInBytes)
    }

    /**
     * Gets the maximum capacity of the color glyph cache.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Returns the maximum capacity of the color glyph cache in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1device4-getmaximumcolorglyphcachememory
     */
    GetMaximumColorGlyphCacheMemory() {
        result := ComCall(18, this, "uint")
        return result
    }
}
