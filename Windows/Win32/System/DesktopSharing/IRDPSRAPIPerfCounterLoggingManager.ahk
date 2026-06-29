#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRDPSRAPIPerfCounterLogger.ahk" { IRDPSRAPIPerfCounterLogger }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages IRDPSRAPIPerfCounterLogger objects.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiperfcounterloggingmanager
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIPerfCounterLoggingManager extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPIPerfCounterLoggingManager
     * @type {Guid}
     */
    static IID := Guid("{9a512c86-ac6e-4a8e-b1a4-fcef363f6e64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIPerfCounterLoggingManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateLogger : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIPerfCounterLoggingManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new IRDPSRAPIPerfCounterLogger object.
     * @param {BSTR} bstrCounterName The name of the counter.
     * @returns {IRDPSRAPIPerfCounterLogger} An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapiperfcounterlogger">IRDPSRAPIPerfCounterLogger</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiperfcounterloggingmanager-createlogger
     */
    CreateLogger(bstrCounterName) {
        bstrCounterName := bstrCounterName is String ? BSTR.Alloc(bstrCounterName).Value : bstrCounterName

        result := ComCall(3, this, BSTR, bstrCounterName, "ptr*", &ppLogger := 0, "HRESULT")
        return IRDPSRAPIPerfCounterLogger(ppLogger)
    }

    Query(iid) {
        if (IRDPSRAPIPerfCounterLoggingManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateLogger := CallbackCreate(GetMethod(implObj, "CreateLogger"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateLogger)
    }
}
