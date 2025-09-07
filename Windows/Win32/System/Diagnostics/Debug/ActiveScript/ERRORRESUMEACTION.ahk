#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ERRORRESUMEACTION{

    /**
     * @type {Integer (Int32)}
     */
    static ERRORRESUMEACTION_ReexecuteErrorStatement => 0

    /**
     * @type {Integer (Int32)}
     */
    static ERRORRESUMEACTION_AbortCallAndReturnErrorToCaller => 1

    /**
     * @type {Integer (Int32)}
     */
    static ERRORRESUMEACTION_SkipErrorStatement => 2
}
