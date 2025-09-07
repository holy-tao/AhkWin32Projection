#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the context type.
 * @remarks
 * If you are specifying context information for a legacy ETW event, you only need to specify the TDH_CONTEXT_POINTERSIZE type—the other types are used for WPP events and are ignored for legacy ETW events.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-tdh_context_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TDH_CONTEXT_TYPE{

    /**
     * Null-terminated Unicode string that contains the name of the .tmf file used for parsing the WPP log. Typically, the .tmf file name is picked up from the event GUID so you do not have to specify the file name.
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_WPP_TMFFILE => 0

    /**
     * Null-terminated Unicode string that contains the path to the .tmf file. You do not have to specify this path if the search path contains the file. Only specify this context information if you also specify the TDH_CONTEXT_WPP_TMFFILE context type. If the file is not found, TDH searches the following locations in the given order:
 * 
 * <ul>
 * <li>The path specified in the TRACE_FORMAT_SEARCH_PATH environment variable</li>
 * <li>The current folder</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_WPP_TMFSEARCHPATH => 1

    /**
     * A 1-byte Boolean flag that indicates if the WPP event time stamp should be converted to Universal Time Coordinate (UTC). If 1, the time stamp is converted to UTC. If 0, the time stamp is in local time. By default, the time stamp is in local time.
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_WPP_GMT => 2

    /**
     * Size, in bytes, of the pointer data types or size_t data types used in the event. Indicates if the event used 4-byte or 8-byte values. By default, the pointer size is the pointer size of the decoding computer.
 * 
 * To determine the size of the pointer or size_t value, use the <b>PointerSize</b> member of  <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-logfile-header">TRACE_LOGFILE_HEADER</a> (the first event you receive in your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback contains this header in the data section). However, this value may not be accurate. For example, on a 64-bit computer, a 32-bit application will log 4-byte pointers; however, the session will set <b>PointerSize</b> to 8.
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_POINTERSIZE => 3

    /**
     * Null-terminated Unicode string that contains the name of the .pdb file for the binary that contains WPP messages. This parameter can be used as an alternative to <b>TDH_CONTEXT_WPP_TMFFILE</b> or <b>TDH_CONTEXT_WPP_TMFSEARCHPATH</b>.
 * 
 * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_PDB_PATH => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static TDH_CONTEXT_MAXIMUM => 5
}
