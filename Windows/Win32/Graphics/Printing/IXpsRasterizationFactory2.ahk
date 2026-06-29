#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XPSRAS_BACKGROUND_COLOR.ahk" { XPSRAS_BACKGROUND_COLOR }
#Import ".\IXpsRasterizer.ahk" { IXpsRasterizer }
#Import ".\XPSRAS_RENDERING_MODE.ahk" { XPSRAS_RENDERING_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Storage\Xps\IXpsOMPage.ahk" { IXpsOMPage }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\XPSRAS_PIXEL_FORMAT.ahk" { XPSRAS_PIXEL_FORMAT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsRasterizationFactory2 extends IUnknown {
    /**
     * The interface identifier for IXpsRasterizationFactory2
     * @type {Guid}
     */
    static IID := Guid("{9c16ce3e-10f5-41fd-9ddc-6826669c2ff6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsRasterizationFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateRasterizer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsRasterizationFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IXpsOMPage} xpsPage 
     * @param {Float} DPIX 
     * @param {Float} DPIY 
     * @param {XPSRAS_RENDERING_MODE} nonTextRenderingMode 
     * @param {XPSRAS_RENDERING_MODE} textRenderingMode 
     * @param {XPSRAS_PIXEL_FORMAT} pixelFormat 
     * @param {XPSRAS_BACKGROUND_COLOR} backgroundColor 
     * @returns {IXpsRasterizer} 
     */
    CreateRasterizer(xpsPage, DPIX, DPIY, nonTextRenderingMode, textRenderingMode, pixelFormat, backgroundColor) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPIX, "float", DPIY, XPSRAS_RENDERING_MODE, nonTextRenderingMode, XPSRAS_RENDERING_MODE, textRenderingMode, XPSRAS_PIXEL_FORMAT, pixelFormat, XPSRAS_BACKGROUND_COLOR, backgroundColor, "ptr*", &ppIXpsRasterizer := 0, "HRESULT")
        return IXpsRasterizer(ppIXpsRasterizer)
    }

    Query(iid) {
        if (IXpsRasterizationFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRasterizer := CallbackCreate(GetMethod(implObj, "CreateRasterizer"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRasterizer)
    }
}
