#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IImgErrorInfo.ahk" { IImgErrorInfo }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintPipelineManagerControl extends IUnknown {
    /**
     * The interface identifier for IPrintPipelineManagerControl
     * @type {Guid}
     */
    static IID := Guid("{aa3e4910-5889-4681-91ef-823ad4ed4e44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPipelineManagerControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestShutdown : IntPtr
        FilterFinished  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPipelineManagerControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hrReason 
     * @param {IImgErrorInfo} pReason 
     * @returns {HRESULT} 
     */
    RequestShutdown(hrReason, pReason) {
        result := ComCall(3, this, "int", hrReason, "ptr", pReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FilterFinished() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintPipelineManagerControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestShutdown := CallbackCreate(GetMethod(implObj, "RequestShutdown"), flags, 3)
        this.vtbl.FilterFinished := CallbackCreate(GetMethod(implObj, "FilterFinished"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestShutdown)
        CallbackFree(this.vtbl.FilterFinished)
    }
}
