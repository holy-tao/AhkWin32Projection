#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConditionFactory.ahk

/**
 * Extends the functionality of IConditionFactory. IConditionFactory2 provides methods for creating or resolving a condition tree that was obtained by parsing a query string.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditionfactory2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionFactory2 extends IConditionFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionFactory2
     * @type {Guid}
     */
    static IID => Guid("{71d222e1-432f-429e-8c13-b6dafde5077a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTrueFalse", "CreateNegation", "CreateCompoundFromObjectArray", "CreateCompoundFromArray", "CreateStringLeaf", "CreateIntegerLeaf", "CreateBooleanLeaf", "CreateLeaf", "ResolveCondition"]

    /**
     * Creates a search condition that is either TRUE or FALSE.
     * @param {BOOL} fVal Type: <b>BOOL</b>
     * 
     * The value of the search condition to use. <i>fValue</i> should typically be set to VARIANT_FALSE.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createtruefalse
     */
    CreateTrueFalse(fVal, cco, riid) {
        result := ComCall(7, this, "int", fVal, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a condition node that is a logical negation (NOT) of another condition (a subnode of this node).
     * @param {ICondition} pcSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> subnode to be negated. For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createnegation
     */
    CreateNegation(pcSub, cco, riid) {
        result := ComCall(8, this, "ptr", pcSub, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node that is a conjunction (AND) or a disjunction (OR) of a collection of subconditions. The returned object supports ICondition and ICondition2.
     * @param {Integer} ct Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> enumeration that must be set to either the <i>CT_AND_CONDITION</i> or <i>CT_OR_CONDITION</i> flag.
     * @param {IObjectArray} poaSubs Type: <b>IObjectArray*</b>
     * 
     *  Each element of the <i>poaSubs</i> parameter must implement <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>. This parameter may also be <b>NULL</b>, which is equivalent to being empty.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromobjectarray
     */
    CreateCompoundFromObjectArray(ct, poaSubs, cco, riid) {
        result := ComCall(9, this, "int", ct, "ptr", poaSubs, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node that is a conjunction (AND) or a disjunction (OR) from an array of condition nodes. The returned object supports ICondition and ICondition2.
     * @param {Integer} ct Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> enumeration that must be set to either the <i>CT_AND_CONDITION</i> or <i>CT_OR_CONDITION</i> flag.
     * @param {Pointer<ICondition>} ppcondSubs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Each element of the <i>ppCondSubs</i> parameter must implement <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>.
     * @param {Integer} cSubs Type: <b>ULONG</b>
     * 
     * The leaf subcondition as an unsigned 64-bit integer value.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromarray
     */
    CreateCompoundFromArray(ct, ppcondSubs, cSubs, cco, riid) {
        result := ComCall(10, this, "int", ct, "ptr*", ppcondSubs, "uint", cSubs, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for a string value that represents a comparison of property value and constant value. The returned object supports ICondition and ICondition2.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {PWSTR} pszValue Type: <b>LPCWSTR</b>
     * 
     * The value to be compared, or <b>NULL</b> for an unspecified property. The locale name of the leaf node is LOCALE_NAME_USER_DEFAULT.
     * @param {PWSTR} pszLocaleName Type: <b>LPCWSTR</b>
     * 
     * The name of the locale of the lead condition, or <b>NULL</b> for a plain string. The locale name of the leaf node is LOCALE_NAME_USER_DEFAULT.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createstringleaf
     */
    CreateStringLeaf(propkey, cop, pszValue, pszLocaleName, cco, riid) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, "ptr", propkey, "int", cop, "ptr", pszValue, "ptr", pszLocaleName, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for an integer value. The returned object supports ICondition and ICondition2.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {Integer} lValue Type: <b>INT32</b>
     * 
     * The value of a leaf condition node as a 32-bit integer.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createintegerleaf
     */
    CreateIntegerLeaf(propkey, cop, lValue, cco, riid) {
        result := ComCall(12, this, "ptr", propkey, "int", cop, "int", lValue, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a search condition that is either TRUE or FALSE.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {BOOL} fValue Type: <b>BOOL</b>
     * 
     * The value of the search condition to use. <i>fValue</i> should typically be set to VARIANT_FALSE.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createbooleanleaf
     */
    CreateBooleanLeaf(propkey, cop, fValue, cco, riid) {
        result := ComCall(13, this, "ptr", propkey, "int", cop, "int", fValue, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for any value. The returned object supports ICondition and ICondition2.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPERTYKEY</b>
     * 
     * The property value of the leaf condition as a REFPROPERTYKEY.
     * @param {PWSTR} pszSemanticType Type: <b>LPCWSTR</b>
     * 
     * The name of a semantic type of the value, or <b>NULL</b> for a plain string. If the newly created leaf is an unresolved named entity, <i>pszSemanticType</i> should be the name of a semantic type, otherwise <b>NULL</b>.
     * @param {PWSTR} pszLocaleName Type: <b>LPCWSTR</b>
     * 
     * The name of the locale to be compared, or <b>NULL</b> for an unspecified locale. If <i>propvar</i> does not contain a string value, then <i>pszLocaleName</i> should be LOCALE_NAME_USER_DEFAULT; otherwise, <i>pszLocaleName</i> should reflect the language the string. Alternatively, <i>pszLocaleName</i> could be  LOCALE_NAME_INVARIANT.
     * @param {IRichChunk} pPropertyNameTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the property. It can be <b>NULL</b>.
     * @param {IRichChunk} pOperationTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the operation. It can be <b>NULL</b>.
     * @param {IRichChunk} pValueTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that repesents the value. It can be <b>NULL</b>.
     * @param {Integer} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-createleaf
     */
    CreateLeaf(propkey, cop, propvar, pszSemanticType, pszLocaleName, pPropertyNameTerm, pOperationTerm, pValueTerm, cco, riid) {
        pszSemanticType := pszSemanticType is String ? StrPtr(pszSemanticType) : pszSemanticType
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(14, this, "ptr", propkey, "int", cop, "ptr", propvar, "ptr", pszSemanticType, "ptr", pszLocaleName, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Performs a variety of transformations on a condition tree, and thereby the resolved condition for evaluation. The returned object supports ICondition and ICondition2.
     * @param {ICondition} pc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> object to be resolved.
     * @param {Integer} sqro Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_resolve_option">STRUCTURED_QUERY_RESOLVE_OPTION</a></b>
     * 
     * Specifies zero or more of the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_resolve_option">STRUCTURED_QUERY_RESOLVE_OPTION</a> flags. The <i>SQRO_NULL_VALUE_TYPE_FOR_PLAIN_VALUES</i> flag is automatically added to <i>sqro</i>.
     * @param {Pointer<SYSTEMTIME>} pstReferenceTime Type: <b>SYSTEMTIME const*</b>
     * 
     * Pointer to a <b>SYSTEMTIME</b> value to use as the reference date and time. A null pointer can be passed if <i>sqro</i> is set to the <i>SQRO_DONT_RESOLVE_DATETIME</i> flag.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the  enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditionfactory2-resolvecondition
     */
    ResolveCondition(pc, sqro, pstReferenceTime, riid) {
        result := ComCall(15, this, "ptr", pc, "int", sqro, "ptr", pstReferenceTime, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
