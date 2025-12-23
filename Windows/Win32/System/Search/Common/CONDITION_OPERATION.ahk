#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of flags to be used with following methods to indicate the operation in ICondition::GetComparisonInfo, ICondition2::GetLeafConditionInfo, IConditionFactory::MakeLeaf, IConditionFactory2::CreateBooleanLeaf, IConditionFactory2::CreateIntegerLeaf, IConditionFactory2::MakeLeaf, IConditionFactory2::CreateStringLeaf, and IConditionGenerator::GenerateForLeaf.
 * @remarks
 * Because a resolved condition never has a <b>COP_IMPLICIT</b> operation, applications that evaluate condition trees should not encounter it. However, <b>COP_IMPLICIT</b> could be used in comparing the output of either <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nf-structuredquerycondition-icondition-getcomparisoninfo">ICondition::GetComparisonInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nf-structuredquerycondition-icondition2-getleafconditioninfo">ICondition2::GetLeafConditionInfo</a> for a parsed unresolved condition to the output for a resolved condition.
 * 
 * In Windows 7, this enumeration is defined in structuredquerycondition.idl and structuredquerycondition.h. Prior to Windows 7 this enumeration was declared in structuredquery.h and structuredquery.idl.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation
 * @namespace Windows.Win32.System.Search.Common
 * @version v4.0.30319
 */
class CONDITION_OPERATION extends Win32Enum{

    /**
     * An implicit comparison between the value of the property and the value of the constant. For an unresolved condition, <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">COP_IMPLICIT</a> means that a user did not type an operation. In contrast, a resolved condition will always have a condition other than the <b>COP_IMPLICIT</b> operation.
     * @type {Integer (Int32)}
     */
    static COP_IMPLICIT => 0

    /**
     * The value of the property and the value of the constant must be equal.
     * @type {Integer (Int32)}
     */
    static COP_EQUAL => 1

    /**
     * The value of the property and the value of the constant must not be equal.
     * @type {Integer (Int32)}
     */
    static COP_NOTEQUAL => 2

    /**
     * The value of the property must be less than the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_LESSTHAN => 3

    /**
     * The value of the property must be greater than the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_GREATERTHAN => 4

    /**
     * The value of the property must be less than or equal to the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_LESSTHANOREQUAL => 5

    /**
     * The value of the property must be greater than or equal to the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_GREATERTHANOREQUAL => 6

    /**
     * The value of the property must begin with the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_VALUE_STARTSWITH => 7

    /**
     * The value of the property must end with the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_VALUE_ENDSWITH => 8

    /**
     * The value of the property must contain the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_VALUE_CONTAINS => 9

    /**
     * The value of the property must not contain the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_VALUE_NOTCONTAINS => 10

    /**
     * The value of the property must match the value of the constant, where '?' matches any single character and '*' matches any sequence of characters.
     * @type {Integer (Int32)}
     */
    static COP_DOSWILDCARDS => 11

    /**
     * The value of the property must contain a word that is the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_WORD_EQUAL => 12

    /**
     * The value of the property must contain a word that begins with the value of the constant.
     * @type {Integer (Int32)}
     */
    static COP_WORD_STARTSWITH => 13

    /**
     * The application is free to interpret this in any suitable way.
     * @type {Integer (Int32)}
     */
    static COP_APPLICATION_SPECIFIC => 14
}
