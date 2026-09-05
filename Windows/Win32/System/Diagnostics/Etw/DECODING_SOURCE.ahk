#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the source of the event data.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-decoding_source
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class DECODING_SOURCE extends Win32Enum {

    /**
     * The source of the event data is a XML manifest.
     * Native name: DecodingSourceXMLFile
     * @type {Integer (Int32)}
     */
    static SourceXMLFile => 0

    /**
     * The source of the event data is a WMI MOF class.
     * Native name: DecodingSourceWbem
     * @type {Integer (Int32)}
     */
    static Wbem => 1

    /**
     * The source of the event data is a TMF file.
     * Native name: DecodingSourceWPP
     * @type {Integer (Int32)}
     */
    static SourceWPP => 2

    /**
     * Indicates that the event was a self-describing event and was decoded using TraceLogging metadata.
     * Native name: DecodingSourceTlg
     * @type {Integer (Int32)}
     */
    static Tlg => 3

    /**
     * Native name: DecodingSourceMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
