#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FTP_PROCESS_STATUS.ahk" { FTP_PROCESS_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PRE_PROCESS_PARAMETERS.ahk" { PRE_PROCESS_PARAMETERS }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IFtpPreprocessProvider extends IUnknown {
    /**
     * The interface identifier for IFtpPreprocessProvider
     * @type {Guid}
     */
    static IID := Guid("{a3c19b60-5a28-471a-8f93-ab30411cee82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFtpPreprocessProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandlePreprocess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFtpPreprocessProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PRE_PROCESS_PARAMETERS>} pPreProcessParameters 
     * @returns {FTP_PROCESS_STATUS} 
     */
    HandlePreprocess(pPreProcessParameters) {
        result := ComCall(3, this, PRE_PROCESS_PARAMETERS.Ptr, pPreProcessParameters, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }

    Query(iid) {
        if (IFtpPreprocessProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandlePreprocess := CallbackCreate(GetMethod(implObj, "HandlePreprocess"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandlePreprocess)
    }
}
