#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of flags to be used with the following methods to indicate the type of condition tree node:\_ICondition::GetConditionType, IConditionFactory::MakeAndOr, IConditionFactory2::CreateCompoundFromArray, and IConditionFactory2::CreateCompoundFromObjectArray.
 * @remarks
 * 
 * In Windows 7, this enumeration is defined in structuredquerycondition.idl and structuredquerycondition.h. Prior to Windows 7 this enumeration was declared in structuredquery.h and structuredquery.idl.
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/ne-structuredquerycondition-condition_type
 * @namespace Windows.Win32.System.Search.Common
 * @version v4.0.30319
 */
class CONDITION_TYPE extends Win32Enum{

    /**
     * Indicates that the values of the subterms are combined by "AND".
     * @type {Integer (Int32)}
     */
    static CT_AND_CONDITION => 0

    /**
     * Indicates that the values of the subterms are combined by "OR".
     * @type {Integer (Int32)}
     */
    static CT_OR_CONDITION => 1

    /**
     * Indicates a "NOT" comparison of subterms.
     * @type {Integer (Int32)}
     */
    static CT_NOT_CONDITION => 2

    /**
     * Indicates that the node is a comparison between a property and a constant value using a <a href="https://docs.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation">CONDITION_OPERATION</a>.
     * @type {Integer (Int32)}
     */
    static CT_LEAF_CONDITION => 3
}
