#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class ERRORRESUMEACTION extends Win32Enum {

    /**
     * Native name: ERRORRESUMEACTION_ReexecuteErrorStatement
     * @type {Integer (Int32)}
     */
    static ReexecuteErrorStatement => 0

    /**
     * Native name: ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller
     * @type {Integer (Int32)}
     */
    static AbortCallAndReturnErrorToCaller => 1

    /**
     * Native name: ERRORRESUMEACTION_SkipErrorStatement
     * @type {Integer (Int32)}
     */
    static SkipErrorStatement => 2
}
