#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationClientInfo extends IUnknown {
    /**
     * The interface identifier for IUIAutomationClientInfo
     * @type {Guid}
     */
    static IID := Guid("{b2e8a3f1-4c5d-4e7a-8f6b-3d2e1c9a0b8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationClientInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProcessId   : IntPtr
        get_ProcessName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationClientInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * @type {BSTR} 
     */
    ProcessName {
        get => this.get_ProcessName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        result := ComCall(3, this, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProcessName() {
        processName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, processName, "HRESULT")
        return processName
    }

    Query(iid) {
        if (IUIAutomationClientInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProcessId := CallbackCreate(GetMethod(implObj, "get_ProcessId"), flags, 2)
        this.vtbl.get_ProcessName := CallbackCreate(GetMethod(implObj, "get_ProcessName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProcessId)
        CallbackFree(this.vtbl.get_ProcessName)
    }
}
