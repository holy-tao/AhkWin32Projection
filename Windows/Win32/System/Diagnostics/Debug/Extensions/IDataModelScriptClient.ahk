#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ErrorClass.ahk" { ErrorClass }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptClient extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptClient
     * @type {Guid}
     */
    static IID := Guid("{3b362b0e-89f0-46c6-a663-dfdc95194aef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ErrorClass} errClass 
     * @param {HRESULT} hrFail 
     * @param {PWSTR} message 
     * @param {Integer} line 
     * @param {Integer} position 
     * @returns {HRESULT} 
     */
    ReportError(errClass, hrFail, message, line, position) {
        message := message is String ? StrPtr(message) : message

        result := ComCall(3, this, ErrorClass, errClass, "int", hrFail, "ptr", message, "uint", line, "uint", position, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataModelScriptClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportError := CallbackCreate(GetMethod(implObj, "ReportError"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportError)
    }
}
