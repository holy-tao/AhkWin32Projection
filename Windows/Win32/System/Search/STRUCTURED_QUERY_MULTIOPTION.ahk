#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A set of flags used by IQueryParser::SetMultiOption to indicate individual options.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-structured_query_multioption
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class STRUCTURED_QUERY_MULTIOPTION extends Win32Enum{

    /**
     * To indicate that a leaf node with property name P and constant C should be replaced with a leaf node with property name Q, operation op, and constant C by <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">IConditionFactory::Resolve</a>, do the following: call <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> with SQMO_VIRTUAL_PROPERTY as <i>option</i>, P as <i>pszOptionKey</i>, and for <i>pOptionValue</i> provide a <b>VT_UNKNOWN</b> with an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface that enumerates exactly two values: a <b>VT_BSTR</b> with value Q, and a <b>VT_I4</b> that is a <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a> operation.
     * @type {Integer (Int32)}
     */
    static SQMO_VIRTUAL_PROPERTY => 0

    /**
     * To indicate that a leaf node with no property name and a semantic type T (or one that is a subtype of T) should be replaced with one having property name P by <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory-resolve">IConditionFactory::Resolve</a>, do the following: call <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> with SQMO_DEFAULT_PROPERTY  as <i>option</i>, T as <i>pszOptionKey</i>, and for <i>pOptionValue</i> provide a <b>VT_LPWSTR</b> with value P.
     * @type {Integer (Int32)}
     */
    static SQMO_DEFAULT_PROPERTY => 1

    /**
     * To indicate that an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iconditiongenerator">IConditionGenerator</a> G should be used to recognize named entities of the semantic type named T, and that <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory-resolve">IConditionFactory::Resolve</a> should generate condition trees for those named entities, call <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> with SQMO_GENERATOR_FOR_TYPE as <i>option</i>, T as <i>pszOptionKey</i> and for <i>pOptionValue</i> provide a <b>VT_UNKNOWN</b> with value G.
     * @type {Integer (Int32)}
     */
    static SQMO_GENERATOR_FOR_TYPE => 2

    /**
     * Windows 7, and later. To indicate that a node with property P should map to one or more other properties, call <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iqueryparser-setmultioption">IQueryParser::SetMultiOption</a> with SQMO_MAP_PROPERTY as <i>option</i>, P as <i>pszOptionKey</i>, and for <i>pOptionValue</i> provide a <b>VT_VECTOR</b> or <b>VT_LPWSTR</b>, where each string is a property name. During resolution, this map is added to those of the loaded schema. Calling <b>IQueryParser::SetMultiOption</b> with <i>pOptionValue</i> as <b>VT_NULL</b> removes the mapping.
     * @type {Integer (Int32)}
     */
    static SQMO_MAP_PROPERTY => 3
}
