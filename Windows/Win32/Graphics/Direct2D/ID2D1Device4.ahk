#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1DeviceContext4.ahk" { ID2D1DeviceContext4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }
#Import ".\ID2D1Device3.ahk" { ID2D1Device3 }

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the ID2D1Device3 interface. It also enables the creation of ID2D1DeviceContext4 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1device4
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device4 extends ID2D1Device3 {
    /**
     * The interface identifier for ID2D1Device4
     * @type {Guid}
     */
    static IID := Guid("{d7bdb159-5683-4a46-bc9c-72dc720b858b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device4 interfaces
    */
    struct Vtbl extends ID2D1Device3.Vtbl {
        CreateDeviceContext             : IntPtr
        SetMaximumColorGlyphCacheMemory : IntPtr
        GetMaximumColorGlyphCacheMemory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new ID2D1DeviceContext4 from this Direct2D device.
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext4} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1devicecontext4">ID2D1DeviceContext4</a>**</b>
     * 
     * When this method returns, contains a pointer to the new device context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(16, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext4 := 0, "HRESULT")
        return ID2D1DeviceContext4(deviceContext4)
    }

    /**
     * Sets the maximum capacity of the color glyph cache.
     * @remarks
     * The color glyph cache is used to store color bitmap glyphs and SVG glyphs, enabling faster performance if the same
     *       glyphs are needed again. The capacity determines the amount of memory that D2D may use to store glyphs that the application does not already reference. If the
     *       application references a glyph using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getcolorbitmapglyphimage">GetColorBitmapGlyphImage</a> or
     *       <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext4-getsvgglyphimage">GetSvgGlyphImage</a>, after it has been evicted, this
     *       glyph does not count toward the cache capacity.
     * @param {Integer} maximumInBytes Type: <b>UINT64</b>
     * 
     * The maximum capacity of the color glyph cache.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-setmaximumcolorglyphcachememory
     */
    SetMaximumColorGlyphCacheMemory(maximumInBytes) {
        ComCall(17, this, "uint", maximumInBytes)
    }

    /**
     * Gets the maximum capacity of the color glyph cache.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * Returns the maximum capacity of the color glyph cache in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device4-getmaximumcolorglyphcachememory
     */
    GetMaximumColorGlyphCacheMemory() {
        result := ComCall(18, this, Int64)
        return result
    }

    Query(iid) {
        if (ID2D1Device4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceContext := CallbackCreate(GetMethod(implObj, "CreateDeviceContext"), flags, 3)
        this.vtbl.SetMaximumColorGlyphCacheMemory := CallbackCreate(GetMethod(implObj, "SetMaximumColorGlyphCacheMemory"), flags, 2)
        this.vtbl.GetMaximumColorGlyphCacheMemory := CallbackCreate(GetMethod(implObj, "GetMaximumColorGlyphCacheMemory"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceContext)
        CallbackFree(this.vtbl.SetMaximumColorGlyphCacheMemory)
        CallbackFree(this.vtbl.GetMaximumColorGlyphCacheMemory)
    }
}
