#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk

/**
 * Extends the functionality of the ICondition interface. ICondition2 provides methods for retrieving information about a search condition.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nn-structuredquerycondition-icondition2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICondition2 extends ICondition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICondition2
     * @type {Guid}
     */
    static IID => Guid("{0db8851d-2e5b-47eb-9208-d28c325a01d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocale", "GetLeafConditionInfo"]

    /**
     * Retrieves the property name, operation, and value from a leaf search condition node.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the name of the locale of the leaf condition as a Unicode string. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition2-getlocale
     */
    GetLocale() {
        result := ComCall(15, this, "ptr*", &ppszLocaleName := 0, "HRESULT")
        return ppszLocaleName
    }

    /**
     * Retrieves the property name, operation, and value from a leaf search condition node.
     * @param {Pointer<PROPERTYKEY>} ppropkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * Receives the name of the property of the leaf condition as a PROPERTYKEY.
     * @param {Pointer<Integer>} pcop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>*</b>
     * 
     * Receives the operation of the leaf condition as a <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives the property value of the leaf condition as a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, E_FAIL if this is not a leaf node, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition2-getleafconditioninfo
     */
    GetLeafConditionInfo(ppropkey, pcop, ppropvar) {
        pcopMarshal := pcop is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", ppropkey, pcopMarshal, pcop, "ptr", ppropvar, "HRESULT")
        return result
    }
}
