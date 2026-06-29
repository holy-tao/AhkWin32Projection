#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsRasterizer.ahk" { IXpsRasterizer }
#Import ".\XPSRAS_RENDERING_MODE.ahk" { XPSRAS_RENDERING_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Storage\Xps\IXpsOMPage.ahk" { IXpsOMPage }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsRasterizationFactory extends IUnknown {
    /**
     * The interface identifier for IXpsRasterizationFactory
     * @type {Guid}
     */
    static IID := Guid("{e094808a-24c6-482b-a3a7-c21ac9b55f17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsRasterizationFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateRasterizer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsRasterizationFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IXpsOMPage} xpsPage 
     * @param {Float} DPI 
     * @param {XPSRAS_RENDERING_MODE} nonTextRenderingMode 
     * @param {XPSRAS_RENDERING_MODE} textRenderingMode 
     * @returns {IXpsRasterizer} 
     */
    CreateRasterizer(xpsPage, DPI, nonTextRenderingMode, textRenderingMode) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPI, XPSRAS_RENDERING_MODE, nonTextRenderingMode, XPSRAS_RENDERING_MODE, textRenderingMode, "ptr*", &ppIXPSRasterizer := 0, "HRESULT")
        return IXpsRasterizer(ppIXPSRasterizer)
    }

    Query(iid) {
        if (IXpsRasterizationFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRasterizer := CallbackCreate(GetMethod(implObj, "CreateRasterizer"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRasterizer)
    }
}
