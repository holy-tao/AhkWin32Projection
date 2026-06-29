#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Imaging\IWICBitmap.ahk" { IWICBitmap }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXpsRasterizerNotificationCallback.ahk" { IXpsRasterizerNotificationCallback }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsRasterizer extends IUnknown {
    /**
     * The interface identifier for IXpsRasterizer
     * @type {Guid}
     */
    static IID := Guid("{7567cfc8-c156-47a8-9dac-11a2ae5bdd6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsRasterizer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RasterizeRect       : IntPtr
        SetMinimalLineWidth : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsRasterizer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {IXpsRasterizerNotificationCallback} notificationCallback 
     * @returns {IWICBitmap} 
     */
    RasterizeRect(x, y, width, height, notificationCallback) {
        result := ComCall(3, this, "int", x, "int", y, "int", width, "int", height, "ptr", notificationCallback, "ptr*", &_bitmap := 0, "HRESULT")
        return IWICBitmap(_bitmap)
    }

    /**
     * 
     * @param {Integer} width 
     * @returns {HRESULT} 
     */
    SetMinimalLineWidth(width) {
        result := ComCall(4, this, "int", width, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsRasterizer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RasterizeRect := CallbackCreate(GetMethod(implObj, "RasterizeRect"), flags, 7)
        this.vtbl.SetMinimalLineWidth := CallbackCreate(GetMethod(implObj, "SetMinimalLineWidth"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RasterizeRect)
        CallbackFree(this.vtbl.SetMinimalLineWidth)
    }
}
