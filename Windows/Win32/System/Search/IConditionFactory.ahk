#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for creating or resolving a condition tree that was obtained by parsing a query string.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditionfactory
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionFactory
     * @type {Guid}
     */
    static IID => Guid("{a5efe073-b16f-474f-9f3e-9f8b497a3e08}")

    /**
     * The class identifier for ConditionFactory
     * @type {Guid}
     */
    static CLSID => Guid("{e03e85b0-7be3-4000-ba98-6c13de9fa486}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeNot", "MakeAndOr", "MakeLeaf", "Resolve"]

    /**
     * Creates a condition node that is a logical negation (NOT) of another condition (a subnode of this node).
     * @param {ICondition} pcSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> subnode to be negated.
     * @param {BOOL} fSimplify Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to logically simplify the result if possible; <b>FALSE</b> otherwise. In a query builder scenario, <i>fSimplify</i> should typically be set to VARIANT_FALSE.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> node.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory-makenot
     */
    MakeNot(pcSub, fSimplify) {
        result := ComCall(3, this, "ptr", pcSub, "int", fSimplify, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * Creates a condition node that is a logical conjunction (AND) or disjunction (OR) of a collection of subconditions.
     * @param {Integer} ct Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> of the condition node. The <b>CONDITION_TYPE</b> must be either <b>CT_AND_CONDITION</b> or <b>CT_OR_CONDITION</b>.
     * @param {IEnumUnknown} peuSubs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>*</b>
     * 
     * A pointer to an enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> objects, or <b>NULL</b> for an empty enumeration.
     * @param {BOOL} fSimplify Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to logically simplify the result, if possible; then the result will not necessarily to be of the specified kind. <b>FALSE</b> if the result should have exactly the prescribed structure. 
     * 
     * 
     * An application that plans to execute a query based on the condition tree would typically benefit from setting this parameter to <b>TRUE</b>.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives the address of a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> node.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory-makeandor
     */
    MakeAndOr(ct, peuSubs, fSimplify) {
        result := ComCall(4, this, "int", ct, "ptr", peuSubs, "int", fSimplify, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * Creates a leaf condition node that represents a comparison of property value and constant value.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * The name of a property to be compared, or <b>NULL</b> for an unspecified property. The locale name of the leaf node is LOCALE_NAME_USER_DEFAULT.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration.
     * @param {PWSTR} pszValueType Type: <b>LPCWSTR</b>
     * 
     * The name of a semantic type of the value, or <b>NULL</b> for a plain string.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b>PROPVARIANT const*</b>
     * 
     * The constant value against which the property value should be compared.
     * @param {IRichChunk} pPropertyNameTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the property. It can be <b>NULL</b>.
     * @param {IRichChunk} pOperationTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the operation. It can be <b>NULL</b>.
     * @param {IRichChunk} pValueTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the value. It can be <b>NULL</b>.
     * @param {BOOL} fExpand Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b> and <i>pszPropertyName</i> identifies a virtual property, the resulting node is not a leaf node; instead, it is a disjunction of leaf condition nodes, each of which corresponds to one expansion of the virtual property.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> leaf node.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory-makeleaf
     */
    MakeLeaf(pszPropertyName, cop, pszValueType, ppropvar, pPropertyNameTerm, pOperationTerm, pValueTerm, fExpand) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType

        result := ComCall(5, this, "ptr", pszPropertyName, "int", cop, "ptr", pszValueType, "ptr", ppropvar, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", fExpand, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * Performs a variety of transformations on a condition tree, including the following:\_resolves conditions with relative date/time expressions to conditions with absolute date/time (as a VT_FILETIME); turns other recognized named entities into condition trees with actual values; simplifies condition trees; replaces virtual or compound properties with OR trees of other properties; removes condition trees resulting from queries with property keywords that had no condition applied.
     * @param {ICondition} pc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> object to be resolved.
     * @param {Integer} sqro Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_resolve_option">STRUCTURED_QUERY_RESOLVE_OPTION</a></b>
     * 
     * Specifies zero or more of the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_resolve_option">STRUCTURED_QUERY_RESOLVE_OPTION</a> flags. For <b>Windows 7 and later</b>, the SQRO_ADD_VALUE_TYPE_FOR_PLAIN_VALUES flag is automatically added to <i>sqro</i>.
     * @param {Pointer<SYSTEMTIME>} pstReferenceTime Type: <b>SYSTEMTIME const*</b>
     * 
     * A pointer to a <b>SYSTEMTIME</b> value to use as the reference date and time. A null pointer can be passed if <i>sqro</i> is set to SQRO_DONT_RESOLVE_DATETIME.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> in which all time fields have been resolved to have values of type VT_FILETIME. This new condition tree is the resolved version of <i>pc</i>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory-resolve
     */
    Resolve(pc, sqro, pstReferenceTime) {
        result := ComCall(6, this, "ptr", pc, "int", sqro, "ptr", pstReferenceTime, "ptr*", &ppcResolved := 0, "HRESULT")
        return ICondition(ppcResolved)
    }
}
