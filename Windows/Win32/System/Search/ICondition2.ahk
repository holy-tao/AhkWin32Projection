#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "Common\CONDITION_OPERATION.ahk" { CONDITION_OPERATION }
#Import ".\ICondition.ahk" { ICondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * Extends the functionality of the ICondition interface. ICondition2 provides methods for retrieving information about a search condition.
 * @remarks
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nn-structuredquerycondition-icondition2
 * @namespace Windows.Win32.System.Search
 */
export default struct ICondition2 extends ICondition {
    /**
     * The interface identifier for ICondition2
     * @type {Guid}
     */
    static IID := Guid("{0db8851d-2e5b-47eb-9208-d28c325a01d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICondition2 interfaces
    */
    struct Vtbl extends ICondition.Vtbl {
        GetLocale            : IntPtr
        GetLeafConditionInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICondition2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the property name, operation, and value from a leaf search condition node. (ICondition2.GetLocale)
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the name of the locale of the leaf condition as a Unicode string. This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition2-getlocale
     */
    GetLocale() {
        result := ComCall(15, this, PWSTR.Ptr, &ppszLocaleName := 0, "HRESULT")
        return ppszLocaleName
    }

    /**
     * Retrieves the property name, operation, and value from a leaf search condition node. (ICondition2.GetLeafConditionInfo)
     * @remarks
     * Any or all of the three parameters can be <b>NULL</b>.
     * 
     * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
     * @param {Pointer<PROPERTYKEY>} ppropkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * Receives the name of the property of the leaf condition as a PROPERTYKEY.
     * @param {Pointer<CONDITION_OPERATION>} pcop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>*</b>
     * 
     * Receives the operation of the leaf condition as a <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives the property value of the leaf condition as a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, E_FAIL if this is not a leaf node, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition2-getleafconditioninfo
     */
    GetLeafConditionInfo(ppropkey, pcop, ppropvar) {
        pcopMarshal := pcop is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, PROPERTYKEY.Ptr, ppropkey, pcopMarshal, pcop, PROPVARIANT.Ptr, ppropvar, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICondition2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocale := CallbackCreate(GetMethod(implObj, "GetLocale"), flags, 2)
        this.vtbl.GetLeafConditionInfo := CallbackCreate(GetMethod(implObj, "GetLeafConditionInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocale)
        CallbackFree(this.vtbl.GetLeafConditionInfo)
    }
}
