#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext4>} deviceContext4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-createdevicecontext
     */
    CreateDeviceContext(options, deviceContext4) {
        result := ComCall(16, this, "int", options, "ptr*", deviceContext4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} maximumInBytes 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-setmaximumcolorglyphcachememory
     */
    SetMaximumColorGlyphCacheMemory(maximumInBytes) {
        ComCall(17, this, "uint", maximumInBytes)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-getmaximumcolorglyphcachememory
     */
    GetMaximumColorGlyphCacheMemory() {
        result := ComCall(18, this, "uint")
        return result
    }
}
