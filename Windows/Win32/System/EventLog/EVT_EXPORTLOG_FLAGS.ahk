#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate whether the events come from a channel or log file.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_exportlog_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_EXPORTLOG_FLAGS{

    /**
     * The source of the events is a channel.
     * @type {Integer (UInt32)}
     */
    static EvtExportLogChannelPath => 1

    /**
     * The source of the events is a previously exported log file.
     * @type {Integer (UInt32)}
     */
    static EvtExportLogFilePath => 2

    /**
     * Export events even if part of the query generates an error (is not well formed). The service validates the syntax of the XPath query to determine whether it is well formed. If the validation fails, the service parses the XPath into individual expressions. It builds a new XPath beginning with the leftmost expression. The service validates the expression and if it is valid, the service adds the next expression to the XPath. The service repeats this process until it finds the expression that is failing. It then uses the valid expressions as the XPath query (which means that you may not get the events that you expected). If no part of the XPath is valid, the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtexportlog">EvtExportLog</a> call fails.
     * @type {Integer (UInt32)}
     */
    static EvtExportLogTolerateQueryErrors => 4096

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static EvtExportLogOverwrite => 8192
}
