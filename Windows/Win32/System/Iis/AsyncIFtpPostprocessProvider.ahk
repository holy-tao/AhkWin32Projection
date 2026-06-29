#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\POST_PROCESS_PARAMETERS.ahk" { POST_PROCESS_PARAMETERS }
#Import ".\FTP_PROCESS_STATUS.ahk" { FTP_PROCESS_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIFtpPostprocessProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpPostprocessProvider
     * @type {Guid}
     */
    static IID := Guid("{a16b2542-9694-4eb1-a564-6c2e91fdc133}")

    /**
     * The class identifier for AsyncIFtpPostprocessProvider
     * @type {Guid}
     */
    static CLSID := Guid("{a16b2542-9694-4eb1-a564-6c2e91fdc133}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpPostprocessProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_HandlePostprocess  : IntPtr
        Finish_HandlePostprocess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpPostprocessProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<POST_PROCESS_PARAMETERS>} pPostProcessParameters 
     * @returns {HRESULT} 
     */
    Begin_HandlePostprocess(pPostProcessParameters) {
        result := ComCall(3, this, POST_PROCESS_PARAMETERS.Ptr, pPostProcessParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FTP_PROCESS_STATUS} 
     */
    Finish_HandlePostprocess() {
        result := ComCall(4, this, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }

    Query(iid) {
        if (AsyncIFtpPostprocessProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_HandlePostprocess := CallbackCreate(GetMethod(implObj, "Begin_HandlePostprocess"), flags, 2)
        this.vtbl.Finish_HandlePostprocess := CallbackCreate(GetMethod(implObj, "Finish_HandlePostprocess"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_HandlePostprocess)
        CallbackFree(this.vtbl.Finish_HandlePostprocess)
    }
}
