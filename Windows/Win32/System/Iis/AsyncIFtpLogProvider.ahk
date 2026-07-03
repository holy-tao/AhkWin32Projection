#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\LOGGING_PARAMETERS.ahk" { LOGGING_PARAMETERS }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct AsyncIFtpLogProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIFtpLogProvider
     * @type {Guid}
     */
    static IID := Guid("{00a0ae46-2498-48b2-95e6-df678ed7d49f}")

    /**
     * The class identifier for AsyncIFtpLogProvider
     * @type {Guid}
     */
    static CLSID := Guid("{00a0ae46-2498-48b2-95e6-df678ed7d49f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIFtpLogProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_Log  : IntPtr
        Finish_Log : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIFtpLogProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<LOGGING_PARAMETERS>} pLoggingParameters 
     * @returns {HRESULT} 
     */
    Begin_Log(pLoggingParameters) {
        result := ComCall(3, this, LOGGING_PARAMETERS.Ptr, pLoggingParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Log() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIFtpLogProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_Log := CallbackCreate(GetMethod(implObj, "Begin_Log"), flags, 2)
        this.vtbl.Finish_Log := CallbackCreate(GetMethod(implObj, "Finish_Log"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_Log)
        CallbackFree(this.vtbl.Finish_Log)
    }
}
