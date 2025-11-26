#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk
#Include ..\Com\IPersistStream.ahk

/**
 * Provides methods for retrieving information about a search condition.
 * @remarks
 * 
 * Prior to Windows 7, this interface was only declared in structuredquery.h and structuredquery.idl. In Windows 7, this interface is also defined in structuredquerycondition.idl and structuredquerycondition.h.
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nn-structuredquerycondition-icondition
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICondition extends IPersistStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICondition
     * @type {Guid}
     */
    static IID => Guid("{0fc988d4-c935-4b97-a973-46282ea175c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConditionType", "GetSubConditions", "GetComparisonInfo", "GetValueType", "GetValueNormalization", "GetInputTerms", "Clone"]

    /**
     * Retrieves the condition type for this search condition node, identifying it as a logical AND, OR, or NOT, or as a leaf node.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a>*</b>
     * 
     * Receives the <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> enumeration for this node.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getconditiontype
     */
    GetConditionType() {
        result := ComCall(8, this, "int*", &pNodeType := 0, "HRESULT")
        return pNodeType
    }

    /**
     * Retrieves a collection of the subconditions of the search condition node and the IID of the interface for enumerating the collection.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either IID_IEnumUnknown, IID_IEnumVARIANT or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> objects. Each object is a subcondition of this condition node. If <i>riid</i> was IID_ICondition and this is a negation condition, this parameter receives the single subcondition.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getsubconditions
     */
    GetSubConditions(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the property name, operation, and value from a leaf search condition node.
     * @param {Pointer<PWSTR>} ppszPropertyName Type: <b>LPWSTR*</b>
     * 
     * Receives the name of the property of the leaf condition as a Unicode string.
     * @param {Pointer<Integer>} pcop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>*</b>
     * 
     * Receives the operation of the leaf condition as a <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives the value of the leaf condition as a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, E_FAIL if this is not a leaf node, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getcomparisoninfo
     */
    GetComparisonInfo(ppszPropertyName, pcop, ppropvar) {
        ppszPropertyNameMarshal := ppszPropertyName is VarRef ? "ptr*" : "ptr"
        pcopMarshal := pcop is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, ppszPropertyNameMarshal, ppszPropertyName, pcopMarshal, pcop, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * Retrieves the semantic type of the value of the search condition node.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives either a pointer to the semantic type of the value as a Unicode string or <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getvaluetype
     */
    GetValueType() {
        result := ComCall(11, this, "ptr*", &ppszValueTypeName := 0, "HRESULT")
        return ppszValueTypeName
    }

    /**
     * Retrieves the character-normalized value of the search condition node.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to a Unicode string representation of the value.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getvaluenormalization
     */
    GetValueNormalization() {
        result := ComCall(12, this, "ptr*", &ppszNormalization := 0, "HRESULT")
        return ppszNormalization
    }

    /**
     * For a leaf node, ICondition::GetInputTerms retrieves information about what parts (or ranges) of the input string produced the property, the operation, and the value for the search condition node.
     * @param {Pointer<IRichChunk>} ppPropertyTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> interface that provides information about what part of the input string produced the property of the leaf node, if that can be determined; otherwise, this parameter is set to <b>NULL</b>.
     * @param {Pointer<IRichChunk>} ppOperationTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> interface that provides information about what part of the input string produced the operation of the leaf node, if that can be determined; otherwise, this parameter is set to <b>NULL</b>.
     * @param {Pointer<IRichChunk>} ppValueTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> interface that provides information about what part of the input string produced the value of the leaf node, if that can be determined; otherwise, this parameter is set to <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-getinputterms
     */
    GetInputTerms(ppPropertyTerm, ppOperationTerm, ppValueTerm) {
        result := ComCall(13, this, "ptr*", ppPropertyTerm, "ptr*", ppOperationTerm, "ptr*", ppValueTerm, "HRESULT")
        return result
    }

    /**
     * Creates a deep copy of this ICondition object.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to the clone of this <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nf-structuredquerycondition-icondition-clone
     */
    Clone() {
        result := ComCall(14, this, "ptr*", &ppc := 0, "HRESULT")
        return ICondition(ppc)
    }
}
