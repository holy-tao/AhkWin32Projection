#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides a set of flags to be used with the following interfaces to indicate the type of condition tree node:\_ICondition, ICondition2, IConditionFactory, IConditionFactory2, and IConditionGenerator.
 * @remarks
 * 
  * &gt;Only one of following flags should be set simultaneously:
  *                 
  * 
  * <ul>
  * <li>CONDITION_CREATION_VECTOR_AND</li>
  * <li>CONDITION_CREATION_VECTOR_OR</li>
  * <li>CONDITION_CREATION_VECTOR_LEAF</li>
  * </ul>
  * However, if none of these flags is set, then attempting to create a leaf condition with VT_VECTOR set in the PROPVARIANT results in failure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/ne-structuredquery-condition_creation_options
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CONDITION_CREATION_OPTIONS{

    /**
     * Indicates that the condition is set to the default value.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_DEFAULT => 0

    /**
     * Indicates that the condition is set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_NONE => 0

    /**
     * Indicates that you should simplify the returned condition as much as possible. In some cases this flag indicates that the returned condition is not newly created but refers to an existing object.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_SIMPLIFY => 1

    /**
     * Indicates that you should create an AND condition of leaves with vector elements as values, instead of attempting to create a leaf condition with VT_VECTOR set in the PROPVARIANT.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_VECTOR_AND => 2

    /**
     * Indicates that you should create an OR condition of leaves with vector elements as values, instead of attempting to create a leaf condition with VT_VECTOR set in the PROPVARIANT.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_VECTOR_OR => 4

    /**
     * Indicates that you should allow the creation of a leaf condition with VT_VECTOR set in the PROPVARIANT.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_VECTOR_LEAF => 8

    /**
     * Indicates that you should ignore any specified locale and use the currently selected content locale <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory2-createstringleaf">IConditionFactory2::CreateStringLeaf</a> and <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-iconditionfactory2-createleaf">IConditionFactory2::CreateLeaf</a>.
     * @type {Integer (Int32)}
     */
    static CONDITION_CREATION_USE_CONTENT_LOCALE => 16
}
