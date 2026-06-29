#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInterFilterCommunicator.ahk" { IInterFilterCommunicator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintPipelinePropertyBag.ahk" { IPrintPipelinePropertyBag }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPrintPipelineManagerControl.ahk" { IPrintPipelineManagerControl }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintPipelineFilter extends IUnknown {
    /**
     * The interface identifier for IPrintPipelineFilter
     * @type {Guid}
     */
    static IID := Guid("{cdb62fc0-8bed-434e-86fb-a2cae55f19ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPipelineFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeFilter  : IntPtr
        ShutdownOperation : IntPtr
        StartOperation    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPipelineFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IInterFilterCommunicator} pINegotiation 
     * @param {IPrintPipelinePropertyBag} pIPropertyBag 
     * @param {IPrintPipelineManagerControl} pIPipelineControl 
     * @returns {HRESULT} 
     */
    InitializeFilter(pINegotiation, pIPropertyBag, pIPipelineControl) {
        result := ComCall(3, this, "ptr", pINegotiation, "ptr", pIPropertyBag, "ptr", pIPipelineControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownOperation() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartOperation() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintPipelineFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFilter := CallbackCreate(GetMethod(implObj, "InitializeFilter"), flags, 4)
        this.vtbl.ShutdownOperation := CallbackCreate(GetMethod(implObj, "ShutdownOperation"), flags, 1)
        this.vtbl.StartOperation := CallbackCreate(GetMethod(implObj, "StartOperation"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFilter)
        CallbackFree(this.vtbl.ShutdownOperation)
        CallbackFree(this.vtbl.StartOperation)
    }
}
