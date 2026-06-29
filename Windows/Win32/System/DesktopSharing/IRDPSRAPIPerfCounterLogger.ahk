#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a client application to implement custom performance logging.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiperfcounterlogger
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIPerfCounterLogger extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPIPerfCounterLogger
     * @type {Guid}
     */
    static IID := Guid("{071c2533-0fa4-4e8f-ae83-9c10b4305ab5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIPerfCounterLogger interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LogValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIPerfCounterLogger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Logs a value.
     * @param {Integer} lValue The value to log.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiperfcounterlogger-logvalue
     */
    LogValue(lValue) {
        result := ComCall(3, this, "int64", lValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPIPerfCounterLogger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LogValue := CallbackCreate(GetMethod(implObj, "LogValue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LogValue)
    }
}
