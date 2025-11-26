#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for handling named entities and generating special conditions.
 * @remarks
 * 
 * When an object that supports <b>IConditionGenerator</b> has been registered with a query parser as a semantic type T (using the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> method with the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/ne-structuredquery-structured_query_multioption">SQMO_GENERATOR_FOR_TYPE</a> constant), and that query parser is about to generate a leaf condition node with semantic type T, the query parser first calls the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditiongenerator-generateforleaf">IConditionGenerator::GenerateForLeaf</a> method of the condition generator. If that method returns S_OK, the returned condition tree (which need not be a leaf node) is used. If it returns S_FALSE, then normal processing ia resumed, which generates a leaf node.
 * 
 * A query parser has condition generators preregistered for the known semantic types representing numbers, Booleans, date/time and file paths.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditiongenerator
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionGenerator
     * @type {Guid}
     */
    static IID => Guid("{92d2cc58-4386-45a3-b98c-7e0ce64a4117}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "RecognizeNamedEntities", "GenerateForLeaf", "DefaultPhrase"]

    /**
     * Resets all states of the interface to default values and retrieves any necessary information from the schema.
     * @param {ISchemaProvider} pSchemaProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ischemaprovider">ISchemaProvider</a>*</b>
     * 
     * Pointer to the schema to be used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditiongenerator-initialize
     */
    Initialize(pSchemaProvider) {
        result := ComCall(3, this, "ptr", pSchemaProvider, "HRESULT")
        return result
    }

    /**
     * Identifies named entities in an input string, and creates a collection containing them.
     * @param {PWSTR} pszInputString Type: <b>LPCWSTR</b>
     * 
     * The input string to be parsed.
     * @param {Integer} lcidUserLocale Type: <b>LCID</b>
     * 
     * The LCID against which named entities should be recognized.
     * @param {ITokenCollection} pTokenCollection Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a> object that indicates how the input string was tokenized.
     * @param {INamedEntityCollector} pNamedEntities Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentitycollector">INamedEntityCollector</a>*</b>
     * 
     * On input, contains an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-inamedentitycollector">INamedEntityCollector</a> or <b>NULL</b>. On return, contains an <b>INamedEntityCollector</b> collection of the named entities.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditiongenerator-recognizenamedentities
     */
    RecognizeNamedEntities(pszInputString, lcidUserLocale, pTokenCollection, pNamedEntities) {
        pszInputString := pszInputString is String ? StrPtr(pszInputString) : pszInputString

        result := ComCall(4, this, "ptr", pszInputString, "uint", lcidUserLocale, "ptr", pTokenCollection, "ptr", pNamedEntities, "HRESULT")
        return result
    }

    /**
     * Generates a special query expression for what would otherwise become a leaf query expression.
     * @param {IConditionFactory} pConditionFactory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditionfactory">IConditionFactory</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditionfactory">IConditionFactory</a> object that can be used to create the necessary nodes.
     * @param {PWSTR} pszPropertyName Type: <b>LPCWSTR</b>
     * 
     * Property name, or <b>NULL</b> if there is no property name.
     * @param {Integer} cop Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> enumerated type identifying the operation.
     * @param {PWSTR} pszValueType Type: <b>LPCWSTR</b>
     * 
     * Semantic type describing the values in <i>pszValue</i> and <i>pszValue2</i>.
     * @param {PWSTR} pszValue Type: <b>LPCWSTR</b>
     * 
     * A string generated by <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditiongenerator-recognizenamedentities">IConditionGenerator::RecognizeNamedEntities</a> that represents the value. If <i>pszValue2</i> is not <b>NULL</b>, then this represents the beginning of the value's range.
     * @param {PWSTR} pszValue2 Type: <b>LPCWSTR</b>
     * 
     * If not <b>NULL</b>, a string generated by <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditiongenerator-recognizenamedentities">IConditionGenerator::RecognizeNamedEntities</a> that represents the end of the value's range. If <b>NULL</b>, then <i>pszValue</i> represents a discrete value.
     * @param {IRichChunk} pPropertyNameTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> object containing information about what part of an input string produced the property name.
     * @param {IRichChunk} pOperationTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> object containing information about what part of an input string produced the operation.
     * @param {IRichChunk} pValueTerm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> object containing information about what part of an input string produced the value.
     * @param {BOOL} automaticWildcard Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the generated condition should return results that begin with the specified value, if meaningful. <b>FALSE </b> if the generated condition should return results matching the specified value exactly.
     * @param {Pointer<BOOL>} pNoStringQuery Type: <b>BOOL*</b>
     * 
     * <b>VARIANT_TRUE</b> if the condition tree in <i>ppQueryExpression</i> should be the full query, or <b>VARIANT_FALSE</b> if the full query should be a disjunction of the condition tree in <i>ppQueryExpression</i> and the condition tree that would have been used if this method had returned S_FALSE.
     * @returns {ICondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> condition tree.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditiongenerator-generateforleaf
     */
    GenerateForLeaf(pConditionFactory, pszPropertyName, cop, pszValueType, pszValue, pszValue2, pPropertyNameTerm, pOperationTerm, pValueTerm, automaticWildcard, pNoStringQuery) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszValue2 := pszValue2 is String ? StrPtr(pszValue2) : pszValue2

        pNoStringQueryMarshal := pNoStringQuery is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pConditionFactory, "ptr", pszPropertyName, "int", cop, "ptr", pszValueType, "ptr", pszValue, "ptr", pszValue2, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", automaticWildcard, pNoStringQueryMarshal, pNoStringQuery, "ptr*", &ppQueryExpression := 0, "HRESULT")
        return ICondition(ppQueryExpression)
    }

    /**
     * This method attempts to produce a phrase that, when recognized by this instance of IConditionGenerator, represents the type and value pair for an entity, relationship, or named entity.
     * @param {PWSTR} pszValueType Type: <b>LPCWSTR</b>
     * 
     * The semantic type of the value in <i>ppropvar</i>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT const</a>*</b>
     * 
     * The value to be processed.
     * @param {BOOL} fUseEnglish Type: <b>BOOL</b>
     * 
     *  The parameter fUseEnglish is reserved: it should be ignored by implementors, and callers should pass <b>FALSE</b>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the phrase representing the value. If no phrase can be produced, this parameter is set to <b>NULL</b> and the method returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iconditiongenerator-defaultphrase
     */
    DefaultPhrase(pszValueType, ppropvar, fUseEnglish) {
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType

        result := ComCall(6, this, "ptr", pszValueType, "ptr", ppropvar, "int", fUseEnglish, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
