#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICondition.ahk" { ICondition }
#Import ".\IConditionFactory.ahk" { IConditionFactory }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import ".\STRUCTURED_QUERY_RESOLVE_OPTION.ahk" { STRUCTURED_QUERY_RESOLVE_OPTION }
#Import ".\IRichChunk.ahk" { IRichChunk }
#Import "Common\CONDITION_TYPE.ahk" { CONDITION_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "Common\CONDITION_OPERATION.ahk" { CONDITION_OPERATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CONDITION_CREATION_OPTIONS.ahk" { CONDITION_CREATION_OPTIONS }
#Import "..\..\UI\Shell\Common\IObjectArray.ahk" { IObjectArray }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Extends the functionality of IConditionFactory. IConditionFactory2 provides methods for creating or resolving a condition tree that was obtained by parsing a query string.
 * @remarks
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nn-structuredquery-iconditionfactory2
 * @namespace Windows.Win32.System.Search
 */
export default struct IConditionFactory2 extends IConditionFactory {
    /**
     * The interface identifier for IConditionFactory2
     * @type {Guid}
     */
    static IID := Guid("{71d222e1-432f-429e-8c13-b6dafde5077a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConditionFactory2 interfaces
    */
    struct Vtbl extends IConditionFactory.Vtbl {
        CreateTrueFalse               : IntPtr
        CreateNegation                : IntPtr
        CreateCompoundFromObjectArray : IntPtr
        CreateCompoundFromArray       : IntPtr
        CreateStringLeaf              : IntPtr
        CreateIntegerLeaf             : IntPtr
        CreateBooleanLeaf             : IntPtr
        CreateLeaf                    : IntPtr
        ResolveCondition              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConditionFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a search condition that is either TRUE or FALSE. (IConditionFactory2.CreateTrueFalse)
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {BOOL} fVal Type: <b>BOOL</b>
     * 
     * The value of the search condition to use. <i>fValue</i> should typically be set to VARIANT_FALSE.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createtruefalse
     */
    CreateTrueFalse(fVal, cco, riid) {
        result := ComCall(7, this, BOOL, fVal, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a condition node that is a logical negation (NOT) of another condition (a subnode of this node). (IConditionFactory2.CreateNegation)
     * @remarks
     * Logically simplifying a condition node usually results in a smaller, more easily traversed and processed condition tree. For example, if <i>pcSub</i> is itself a negation condition with a subcondition C, then the double negation is logically resolved, and <i>ppcResult</i> is set to C. Without simplification, the resulting tree would look like NOT — NOT — C.
     * 
     * Applications that need to execute queries based on the condition tree would typically benefit from setting this parameter to <b>TRUE</b>.
     * @param {ICondition} pcSub Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> subnode to be negated. For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createnegation
     */
    CreateNegation(pcSub, cco, riid) {
        result := ComCall(8, this, "ptr", pcSub, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node that is a conjunction (AND) or a disjunction (OR) of a collection of subconditions. The returned object supports ICondition and ICondition2.
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {CONDITION_TYPE} ct Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> enumeration that must be set to either the <i>CT_AND_CONDITION</i> or <i>CT_OR_CONDITION</i> flag.
     * @param {IObjectArray} poaSubs Type: <b>IObjectArray*</b>
     * 
     *  Each element of the <i>poaSubs</i> parameter must implement <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>. This parameter may also be <b>NULL</b>, which is equivalent to being empty.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromobjectarray
     */
    CreateCompoundFromObjectArray(ct, poaSubs, cco, riid) {
        result := ComCall(9, this, CONDITION_TYPE, ct, "ptr", poaSubs, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node that is a conjunction (AND) or a disjunction (OR) from an array of condition nodes. The returned object supports ICondition and ICondition2.
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {CONDITION_TYPE} ct Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type">CONDITION_TYPE</a> enumeration that must be set to either the <i>CT_AND_CONDITION</i> or <i>CT_OR_CONDITION</i> flag.
     * @param {Pointer<ICondition>} ppcondSubs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Each element of the <i>ppCondSubs</i> parameter must implement <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>.
     * @param {Integer} cSubs Type: <b>ULONG</b>
     * 
     * The leaf subcondition as an unsigned 64-bit integer value.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A collection of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromarray
     */
    CreateCompoundFromArray(ct, ppcondSubs, cSubs, cco, riid) {
        result := ComCall(10, this, CONDITION_TYPE, ct, ICondition.Ptr, ppcondSubs, "uint", cSubs, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for a string value that represents a comparison of property value and constant value. The returned object supports ICondition and ICondition2.
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {CONDITION_OPERATION} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {PWSTR} pszValue Type: <b>LPCWSTR</b>
     * 
     * The value to be compared, or <b>NULL</b> for an unspecified property. The locale name of the leaf node is LOCALE_NAME_USER_DEFAULT.
     * @param {PWSTR} pszLocaleName Type: <b>LPCWSTR</b>
     * 
     * The name of the locale of the lead condition, or <b>NULL</b> for a plain string. The locale name of the leaf node is LOCALE_NAME_USER_DEFAULT.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createstringleaf
     */
    CreateStringLeaf(propkey, cop, pszValue, pszLocaleName, cco, riid) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, PROPERTYKEY.Ptr, propkey, CONDITION_OPERATION, cop, "ptr", pszValue, "ptr", pszLocaleName, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for an integer value. The returned object supports ICondition and ICondition2.
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {CONDITION_OPERATION} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {Integer} lValue Type: <b>INT32</b>
     * 
     * The value of a leaf condition node as a 32-bit integer.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, IID_IEnumVARIANT, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createintegerleaf
     */
    CreateIntegerLeaf(propkey, cop, lValue, cco, riid) {
        result := ComCall(12, this, PROPERTYKEY.Ptr, propkey, CONDITION_OPERATION, cop, "int", lValue, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a search condition that is either TRUE or FALSE. (IConditionFactory2.CreateBooleanLeaf)
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {CONDITION_OPERATION} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumeration. If the leaf has no particular operation, then use <i>COP_IMPLICIT</i>.
     * @param {BOOL} fValue Type: <b>BOOL</b>
     * 
     * The value of the search condition to use. <i>fValue</i> should typically be set to VARIANT_FALSE.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createbooleanleaf
     */
    CreateBooleanLeaf(propkey, cop, fValue, cco, riid) {
        result := ComCall(13, this, PROPERTYKEY.Ptr, propkey, CONDITION_OPERATION, cop, BOOL, fValue, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a leaf condition node for any value. The returned object supports ICondition and ICondition2.
     * @remarks
     * For default options, use the <i>CONDITION_CREATION_DEFAULT</i> flag.
     * 
     *  If the leaf condition was obtained by parsing a string, one or more of the parameters <i>pPropertyNameTerm</i>, <i>pOperationTerm </i> and <i>pValueTerm</i> may be represented by an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> interface (obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nf-structuredquerycondition-icondition-getinputterms">ICondition::GetInputTerms</a> method). Otherwise all three parameters can be <b>NULL</b>. 
     * 
     * For more information about leaf node terms (property, value, and operation), see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nf-structuredquerycondition-icondition-getinputterms">ICondition::GetInputTerms</a>.
     * 
     * A virtual property has one or more metadata items in which the key is "MapsToRelation" and the value is a property name (which is one expansion of the property). For more information about metadata, see <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-irelationship-metadata">MetaData</a>.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The name of the property of the leaf condition as a REFPROPERTYKEY. If the leaf has no particular property, use PKEY_Null.
     * @param {CONDITION_OPERATION} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
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
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that represents the property. It can be <b>NULL</b>.
     * @param {IRichChunk} pOperationTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that represents the operation. It can be <b>NULL</b>.
     * @param {IRichChunk} pValueTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> that identifies the range of the input string that represents the value. It can be <b>NULL</b>.
     * @param {CONDITION_CREATION_OPTIONS} cco Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a></b>
     * 
     * The condition creation operation of the leaf condition as the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-condition_creation_options">CONDITION_CREATION_OPTIONS</a> enumeration.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the enumerating interface: either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, or (for a negation condition) IID_ICondition.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition2">ICondition2</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createleaf
     */
    CreateLeaf(propkey, cop, propvar, pszSemanticType, pszLocaleName, pPropertyNameTerm, pOperationTerm, pValueTerm, cco, riid) {
        pszSemanticType := pszSemanticType is String ? StrPtr(pszSemanticType) : pszSemanticType
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(14, this, PROPERTYKEY.Ptr, propkey, CONDITION_OPERATION, cop, PROPVARIANT.Ptr, propvar, "ptr", pszSemanticType, "ptr", pszLocaleName, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, CONDITION_CREATION_OPTIONS, cco, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Performs a variety of transformations on a condition tree, and thereby the resolved condition for evaluation. The returned object supports ICondition and ICondition2.
     * @remarks
     * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
     * 
     * Refer to the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory-resolve">Resolve</a> method for additional detail.
     * @param {ICondition} pc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> object to be resolved.
     * @param {STRUCTURED_QUERY_RESOLVE_OPTION} sqro Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_resolve_option">STRUCTURED_QUERY_RESOLVE_OPTION</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-resolvecondition
     */
    ResolveCondition(pc, sqro, pstReferenceTime, riid) {
        result := ComCall(15, this, "ptr", pc, STRUCTURED_QUERY_RESOLVE_OPTION, sqro, SYSTEMTIME.Ptr, pstReferenceTime, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IConditionFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTrueFalse := CallbackCreate(GetMethod(implObj, "CreateTrueFalse"), flags, 5)
        this.vtbl.CreateNegation := CallbackCreate(GetMethod(implObj, "CreateNegation"), flags, 5)
        this.vtbl.CreateCompoundFromObjectArray := CallbackCreate(GetMethod(implObj, "CreateCompoundFromObjectArray"), flags, 6)
        this.vtbl.CreateCompoundFromArray := CallbackCreate(GetMethod(implObj, "CreateCompoundFromArray"), flags, 7)
        this.vtbl.CreateStringLeaf := CallbackCreate(GetMethod(implObj, "CreateStringLeaf"), flags, 8)
        this.vtbl.CreateIntegerLeaf := CallbackCreate(GetMethod(implObj, "CreateIntegerLeaf"), flags, 7)
        this.vtbl.CreateBooleanLeaf := CallbackCreate(GetMethod(implObj, "CreateBooleanLeaf"), flags, 7)
        this.vtbl.CreateLeaf := CallbackCreate(GetMethod(implObj, "CreateLeaf"), flags, 12)
        this.vtbl.ResolveCondition := CallbackCreate(GetMethod(implObj, "ResolveCondition"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTrueFalse)
        CallbackFree(this.vtbl.CreateNegation)
        CallbackFree(this.vtbl.CreateCompoundFromObjectArray)
        CallbackFree(this.vtbl.CreateCompoundFromArray)
        CallbackFree(this.vtbl.CreateStringLeaf)
        CallbackFree(this.vtbl.CreateIntegerLeaf)
        CallbackFree(this.vtbl.CreateBooleanLeaf)
        CallbackFree(this.vtbl.CreateLeaf)
        CallbackFree(this.vtbl.ResolveCondition)
    }
}
