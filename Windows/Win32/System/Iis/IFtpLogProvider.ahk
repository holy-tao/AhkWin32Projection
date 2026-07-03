#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\LOGGING_PARAMETERS.ahk" { LOGGING_PARAMETERS }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct IFtpLogProvider extends IUnknown {
    /**
     * The interface identifier for IFtpLogProvider
     * @type {Guid}
     */
    static IID := Guid("{a18a94cc-8299-4408-816c-7c3baca1a40e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFtpLogProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Log : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFtpLogProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<LOGGING_PARAMETERS>} pLoggingParameters 
     * @returns {HRESULT} 
     */
    Log(pLoggingParameters) {
        result := ComCall(3, this, LOGGING_PARAMETERS.Ptr, pLoggingParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFtpLogProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Log := CallbackCreate(GetMethod(implObj, "Log"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Log)
    }
}
