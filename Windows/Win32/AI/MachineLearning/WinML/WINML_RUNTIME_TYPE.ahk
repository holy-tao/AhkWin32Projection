#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different types of WinML runtimes.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_runtime_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_RUNTIME_TYPE extends Win32Enum{

    /**
     * Runtime type of CNTK.
     * @type {Integer (Int32)}
     */
    static WINML_RUNTIME_CNTK => 0
}
