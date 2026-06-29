#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IIEWebDriverManager extends IDispatch {
    /**
     * The interface identifier for IIEWebDriverManager
     * @type {Guid}
     */
    static IID := Guid("{bd1dc630-6590-4ca2-a293-6bc72b2438d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIEWebDriverManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ExecuteCommand : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIEWebDriverManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} command 
     * @returns {PWSTR} 
     */
    ExecuteCommand(command) {
        command := command is String ? StrPtr(command) : command

        result := ComCall(7, this, "ptr", command, PWSTR.Ptr, &response := 0, "HRESULT")
        return response
    }

    Query(iid) {
        if (IIEWebDriverManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ExecuteCommand := CallbackCreate(GetMethod(implObj, "ExecuteCommand"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ExecuteCommand)
    }
}
