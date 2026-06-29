#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OEMDMPARAM.ahk" { OEMDMPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintOemCommon extends IUnknown {
    /**
     * The interface identifier for IPrintOemCommon
     * @type {Guid}
     */
    static IID := Guid("{7f42285e-91d5-11d1-8820-00c04fb961ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintOemCommon interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInfo : IntPtr
        DevMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintOemCommon.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Integer} pBuffer 
     * @param {Integer} cbSize 
     * @returns {Integer} 
     */
    GetInfo(dwMode, pBuffer, cbSize) {
        result := ComCall(3, this, "uint", dwMode, "ptr", pBuffer, "uint", cbSize, "uint*", &pcbNeeded := 0, "HRESULT")
        return pcbNeeded
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Pointer<OEMDMPARAM>} pOemDMParam 
     * @returns {HRESULT} 
     */
    DevMode(dwMode, pOemDMParam) {
        result := ComCall(4, this, "uint", dwMode, OEMDMPARAM.Ptr, pOemDMParam, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintOemCommon.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 5)
        this.vtbl.DevMode := CallbackCreate(GetMethod(implObj, "DevMode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.DevMode)
    }
}
