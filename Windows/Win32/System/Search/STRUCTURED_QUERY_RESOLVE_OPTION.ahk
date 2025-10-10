#Requires AutoHotkey v2.0.0 64-bit

/**
 * Options for resolving data into a condition tree.
 * @remarks
 * 
  * The <b>STRUCTURED_QUERY_RESOLVE_OPTION</b> type is defined in StructuredQuery.h as shown here.
  * 
  *             
  * 
  * <pre class="syntax" xml:space="preserve"><c>typedef int STRUCTURED_QUERY_RESOLVE_OPTION;</c></pre>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/ne-structuredquery-structured_query_resolve_option
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class STRUCTURED_QUERY_RESOLVE_OPTION{

    /**
     * <b>Windows 7 and later.</b> The default flag.
     * @type {Integer (Int32)}
     */
    static SQRO_DEFAULT => 0

    /**
     * Unless this flag is set, any relative date/time expression in <i>pConditionTree</i> is replaced with an absolute date/time range that has been resolved against the reference date/time pointed to by <i>pstReferenceTime</i>. For example, if an AQS query contained the relative date/time expression "date:this month" and the reference date/time was 9/19/2006 10:28:33, the resolved condition tree would contain a date/time range beginning at 9/1/2006 00:00:00 and ending at 10/1/2006 00:00:00 (in the UTC time zone).
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_RESOLVE_DATETIME => 1

    /**
     * Unless this flag is set, resolving a relative date/time expression may result in an <b>OR</b> of several intervals. For example, if an AQS query contained "date:Monday" and the reference date/time was 9/19/2006 10:28:33 (a Tuesday), the resolved condition tree would contain an <b>OR</b> of three 24 hour ranges corresponding to the Mondays of 9/11/2006, 9/18/2006 and 9/25/2006, because it is not clear which Monday was referenced. If this flag is set, the result will always be a single date/time range (for this example, it would be a date/time range beginning at 9/18/2006 00:00:00 and ending at 9/19/2006 00:00:00).
     * @type {Integer (Int32)}
     */
    static SQRO_ALWAYS_ONE_INTERVAL => 2

    /**
     * Unless this flag is set, the resulting condition tree will have any possible simplifications applied to it.
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_SIMPLIFY_CONDITION_TREES => 4

    /**
     * Unless this flag is true, a leaf node with a virtual property that maps to several properties will be replaced by an <b>OR</b> of leaf nodes containing the actual properties. For example, the AQS query "to:Bill" may result in a leaf node where the property named <c>System.StructuredQuery.Virtual.To</code> actually maps to the two properties <code>System.Message.ToAddress</code> and <code>System.Message.ToName</c>, so the resolved condition tree would have an <b>OR</b> that looks for "Bill" in those two properties.
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_MAP_RELATIONS => 8

    /**
     * A range resulting from a date/time expression, an expression such as "20..40", is first resolved to a leaf node that has a <b>VT_UNKNOWN</b> value where the punkVal member implements the <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-iinterval">IInterval</a> interface. Unless this flag is set, the returned condition tree will have been further resolved to an <b>AND</b> of simple comparisons such as <i>COP_GREATERTHANOREQUAL</i> and <i>COP_LESSTHAN</i>. For example, for an AQS query "date:this month" resolved against 9/19/2006 10:28:33, if this flag is not set, the resulting condition tree is an <b>AND</b> of System.ItemDate <i>COP_GREATERTHANOREQUAL</i> 9/1/2006 00:00:00 and System.ItemDate <i>COP_LESSTHAN</i> 10/1/2006 00:00:00. If this flag is set, the resulting condition tree will relate System.ItemDate to an <b>IInterval</b> such that its <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iinterval-getlimits">IInterval::GetLimits</a> method returns <i>ILK_EXPLICIT_INCLUDED</i>, 9/1/2006 00:00:00, <i>ILK_EXPLICIT_EXCLUDED</i> and 10/1/2006 00:00:00.
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_RESOLVE_RANGES => 16

    /**
     * An unrestricted keyword is a keyword that is not associated with a value that completes the condition. For example, in the following AQS query, the property denoted by "From" is considered an unrestricted keyword: "Kind:email Subject:"My Resume" From:". If this flag is set, such a property will be present in the resulting condition tree as a leaf node having a <i>COP_IMPLICIT</i> operation, an empty string value, and a semantic type of System.StructuredQueryType.Value. Otherwise, it will be removed entirely.
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_REMOVE_UNRESTRICTED_KEYWORDS => 32

    /**
     * If this flag is set, a group of words not separated by white space will be kept together in a single leaf node. If this flag is not set, the group will be broken up into separate leaf nodes. An application may want to set this flag when resolving a condition tree if the resulting tree will be further processed by code that should do any additional word breaking.
     * @type {Integer (Int32)}
     */
    static SQRO_DONT_SPLIT_WORDS => 64

    /**
     * If a phrase in an AQS query is enclosed in double quotes, the words in that phrase go into a single leaf node (regardless of whether <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory-resolve">SQRO_DONT_SPLIT_WORDS</a> is set) unless this flag is set, in which case they end up in separate leaf nodes and their order no longer matters. An application can set this flag if it is not able to handle leaf nodes with multiple words correctly.
     * @type {Integer (Int32)}
     */
    static SQRO_IGNORE_PHRASE_ORDER => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SQRO_ADD_VALUE_TYPE_FOR_PLAIN_VALUES => 256

    /**
     * Work around known issues in word breakers, adding conditions on <i>PKEY_ItemNameDisplay</i> as needed.
     * @type {Integer (Int32)}
     */
    static SQRO_ADD_ROBUST_ITEM_NAME => 512
}
