#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Represents a condition made up of multiple conditions, at least one of which must be true.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationorcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationOrCondition extends IUIAutomationCondition {
    /**
     * The interface identifier for IUIAutomationOrCondition
     * @type {Guid}
     */
    static IID := Guid("{8753f032-3db1-47b5-a1fc-6e34a266c712}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationOrCondition interfaces
    */
    struct Vtbl extends IUIAutomationCondition.Vtbl {
        get_ChildCount           : IntPtr
        GetChildrenAsNativeArray : IntPtr
        GetChildren              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationOrCondition.Vtbl()
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
     * Retrieves the number of conditions that make up this &quot;or&quot; condition.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-get_childcount
     */
    get_ChildCount() {
        result := ComCall(3, this, "int*", &childCount := 0, "HRESULT")
        return childCount
    }

    /**
     * Retrieves the conditions that make up this &quot;or&quot; condition, as an ordinary array.
     * @param {Pointer<Pointer<IUIAutomationCondition>>} childArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>***</b>
     * 
     * Receives a pointer to an  array of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a> interface pointers.
     * @param {Pointer<Integer>} childArrayCount Type: <b>int*</b>
     * 
     * Receives the number of elements in the array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-getchildrenasnativearray
     */
    GetChildrenAsNativeArray(childArray, childArrayCount) {
        childArrayMarshal := childArray is VarRef ? "ptr*" : "ptr"
        childArrayCountMarshal := childArrayCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, childArrayMarshal, childArray, childArrayCountMarshal, childArrayCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the conditions that make up this &quot;or&quot; condition.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the child conditions.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationorcondition-getchildren
     */
    GetChildren() {
        result := ComCall(5, this, "ptr*", &childArray := 0, "HRESULT")
        return childArray
    }

    Query(iid) {
        if (IUIAutomationOrCondition.IID.Equals(iid)) {
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
