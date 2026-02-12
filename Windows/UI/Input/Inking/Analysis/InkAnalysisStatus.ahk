#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various states of the ink analysis process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisstatus
 * @namespace Windows.UI.Input.Inking.Analysis
 * @version WindowsRuntime 1.4
 */
class InkAnalysisStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Updated => 0

    /**
     * @type {Integer (Int32)}
     */
    static Unchanged => 1
}
