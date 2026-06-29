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
export default struct AsyncIFtpPreprocessProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpPreprocessProvider
     * @type {Guid}
     */
    static IID := Guid("{6ff5fd8f-fd8e-48b1-a3e0-bf7073db4db5}")

    /**
     * The class identifier for AsyncIFtpPreprocessProvider
     * @type {Guid}
     */
    static CLSID := Guid("{6ff5fd8f-fd8e-48b1-a3e0-bf7073db4db5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpPreprocessProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_HandlePreprocess  : IntPtr
        Finish_HandlePreprocess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpPreprocessProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PRE_PROCESS_PARAMETERS>} pPreProcessParameters 
     * @returns {HRESULT} 
     */
    Begin_HandlePreprocess(pPreProcessParameters) {
        result := ComCall(3, this, PRE_PROCESS_PARAMETERS.Ptr, pPreProcessParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FTP_PROCESS_STATUS} 
     */
    Finish_HandlePreprocess() {
        result := ComCall(4, this, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }

    Query(iid) {
        if (AsyncIFtpPreprocessProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_HandlePreprocess := CallbackCreate(GetMethod(implObj, "Begin_HandlePreprocess"), flags, 2)
        this.vtbl.Finish_HandlePreprocess := CallbackCreate(GetMethod(implObj, "Finish_HandlePreprocess"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_HandlePreprocess)
        CallbackFree(this.vtbl.Finish_HandlePreprocess)
    }
}
