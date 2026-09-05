#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for how to apply the rule to the file.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmexecutionoption
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmExecutionOption extends Win32Enum {

    /**
     * The execution option is unknown. Do not use this value.
     * Native name: FsrmExecutionOption_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The rule is applied as a default value to the file if the property is not set on the file (if none of the 
     *       storage modules returns the property).
     * Native name: FsrmExecutionOption_EvaluateUnset
     * @type {Integer (Int32)}
     */
    static EvaluateUnset => 1

    /**
     * The rule is applied to the file considering default and existing values using aggregation rules (for 
     *       aggregation rules, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitiontype">FsrmPropertyDefinitionType</a>).
     * Native name: FsrmExecutionOption_ReEvaluate_ConsiderExistingValue
     * @type {Integer (Int32)}
     */
    static ReEvaluate_ConsiderExistingValue => 2

    /**
     * The rule is applied to the file but  default and existing values are ignored.
     * Native name: FsrmExecutionOption_ReEvaluate_IgnoreExistingValue
     * @type {Integer (Int32)}
     */
    static ReEvaluate_IgnoreExistingValue => 3
}
