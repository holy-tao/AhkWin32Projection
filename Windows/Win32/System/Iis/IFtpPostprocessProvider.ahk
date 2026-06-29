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
export default struct IFtpPostprocessProvider extends IUnknown {
    /**
     * The interface identifier for IFtpPostprocessProvider
     * @type {Guid}
     */
    static IID := Guid("{4522cbc6-16cd-49ad-8653-9a2c579e4280}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFtpPostprocessProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandlePostprocess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFtpPostprocessProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<POST_PROCESS_PARAMETERS>} pPostProcessParameters 
     * @returns {FTP_PROCESS_STATUS} 
     */
    HandlePostprocess(pPostProcessParameters) {
        result := ComCall(3, this, POST_PROCESS_PARAMETERS.Ptr, pPostProcessParameters, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }

    Query(iid) {
        if (IFtpPostprocessProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandlePostprocess := CallbackCreate(GetMethod(implObj, "HandlePostprocess"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandlePostprocess)
    }
}
