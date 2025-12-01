#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify how to return the query results and whether you are query against a channel or log file.
 * @remarks
 * The EvtQueryChannelPath and EvtQueryFilePath flags are mutually exclusive. The EvtQueryForwardDirection and EvtQueryReverseDirection flags are also mutually exclusive.
 * 
 * You can retrieve events only in a forward direction from Debug and Analytic channels and from .evt and .etl log files.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_query_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_QUERY_FLAGS extends Win32Enum{

    /**
     * Specifies that the query is against one or more channels. The <i>Path</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function must specify the name of a  channel or <b>NULL</b>.
     * @type {Integer (UInt32)}
     */
    static EvtQueryChannelPath => 1

    /**
     * Specifies that the query is against one or more log files. The <i>Path</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> function must specify the full path to a log file or <b>NULL</b>.
     * @type {Integer (UInt32)}
     */
    static EvtQueryFilePath => 2

    /**
     * Specifies that the events in the query result are ordered from oldest to newest. This is the default.
     * @type {Integer (UInt32)}
     */
    static EvtQueryForwardDirection => 256

    /**
     * Specifies that the events in the query result are ordered from newest to oldest.
     * @type {Integer (UInt32)}
     */
    static EvtQueryReverseDirection => 512

    /**
     * Specifies that <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtquery">EvtQuery</a> should run the query even if the part of the query generates an error (is not well formed). The service validates the syntax of the XPath query to determine if it is well formed. If the validation fails, the service parses the XPath into individual expressions. It builds a new XPath beginning with the left most expression. The service validates the expression and if it is valid, the service adds the next expression to the XPath. The service repeats this process until it finds the expression that is failing. It then uses the valid expressions that it found beginning with the leftmost expression as the XPath query (which means that you may not get the events that you expected). If no part of the XPath is valid, the <b>EvtQuery</b> call fails.
     * @type {Integer (UInt32)}
     */
    static EvtQueryTolerateQueryErrors => 4096
}
