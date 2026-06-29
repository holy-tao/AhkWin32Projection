#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsPrintJobOperations interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsprintjoboperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPrintJobOperations extends IADs {
    /**
     * The interface identifier for IADsPrintJobOperations
     * @type {Guid}
     */
    static IID := Guid("{9a52db30-1ecf-11cf-a988-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPrintJobOperations interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_Status       : IntPtr
        get_TimeElapsed  : IntPtr
        get_PagesPrinted : IntPtr
        get_Position     : IntPtr
        put_Position     : IntPtr
        Pause            : IntPtr
        Resume           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPrintJobOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    TimeElapsed {
        get => this.get_TimeElapsed()
    }

    /**
     * @type {Integer} 
     */
    PagesPrinted {
        get => this.get_PagesPrinted()
    }

    /**
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimeElapsed() {
        result := ComCall(21, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PagesPrinted() {
        result := ComCall(22, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Position() {
        result := ComCall(23, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnPosition 
     * @returns {HRESULT} 
     */
    put_Position(lnPosition) {
        result := ComCall(24, this, "int", lnPosition, "HRESULT")
        return result
    }

    /**
     * The IADsPrintJobOperations::Pause method halts the processing of the current print job. Call the IADsPrintJobOperations::Resume method to continue the processing.
     * @returns {HRESULT} This method supports standard return values. For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintjoboperations-pause
     */
    Pause() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * The IADsPrintJobOperations::Resume method continues the print job halted by the IADsPrintJobOperations::Pause method.
     * @returns {HRESULT} This method supports the standard return values. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsprintjoboperations-resume
     */
    Resume() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPrintJobOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_TimeElapsed := CallbackCreate(GetMethod(implObj, "get_TimeElapsed"), flags, 2)
        this.vtbl.get_PagesPrinted := CallbackCreate(GetMethod(implObj, "get_PagesPrinted"), flags, 2)
        this.vtbl.get_Position := CallbackCreate(GetMethod(implObj, "get_Position"), flags, 2)
        this.vtbl.put_Position := CallbackCreate(GetMethod(implObj, "put_Position"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_TimeElapsed)
        CallbackFree(this.vtbl.get_PagesPrinted)
        CallbackFree(this.vtbl.get_Position)
        CallbackFree(this.vtbl.put_Position)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
    }
}
