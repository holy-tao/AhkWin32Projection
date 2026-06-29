#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes properties and methods that Microsoft UI Automation client applications can use to retrieve information about an AND-based property condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationandcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationAndCondition extends IUIAutomationCondition {
    /**
     * The interface identifier for IUIAutomationAndCondition
     * @type {Guid}
     */
    static IID := Guid("{a7d0af36-b912-45fe-9855-091ddc174aec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationAndCondition interfaces
    */
    struct Vtbl extends IUIAutomationCondition.Vtbl {
        get_ChildCount           : IntPtr
        GetChildrenAsNativeArray : IntPtr
        GetChildren              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationAndCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ChildCount {
        get => this.get_ChildCount()
    }

    /**
     * Retrieves the number of conditions that make up this &quot;and&quot; condition.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-get_childcount
     */
    get_ChildCount() {
        result := ComCall(3, this, "int*", &childCount := 0, "HRESULT")
        return childCount
    }

    /**
     * Retrieves the conditions that make up this &quot;and&quot; condition, as an ordinary array.
     * @param {Pointer<Pointer<IUIAutomationCondition>>} childArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>***</b>
     * 
     * Receives a pointer to an  array of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a> interface pointers.
     * @param {Pointer<Integer>} childArrayCount Type: <b>int*</b>
     * 
     * Receives the number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-getchildrenasnativearray
     */
    GetChildrenAsNativeArray(childArray, childArrayCount) {
        childArrayMarshal := childArray is VarRef ? "ptr*" : "ptr"
        childArrayCountMarshal := childArrayCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, childArrayMarshal, childArray, childArrayCountMarshal, childArrayCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the conditions that make up this &quot;and&quot; condition.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the child conditions.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationandcondition-getchildren
     */
    GetChildren() {
        result := ComCall(5, this, "ptr*", &childArray := 0, "HRESULT")
        return childArray
    }

    Query(iid) {
        if (IUIAutomationAndCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ChildCount := CallbackCreate(GetMethod(implObj, "get_ChildCount"), flags, 2)
        this.vtbl.GetChildrenAsNativeArray := CallbackCreate(GetMethod(implObj, "GetChildrenAsNativeArray"), flags, 3)
        this.vtbl.GetChildren := CallbackCreate(GetMethod(implObj, "GetChildren"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ChildCount)
        CallbackFree(this.vtbl.GetChildrenAsNativeArray)
        CallbackFree(this.vtbl.GetChildren)
    }
}
