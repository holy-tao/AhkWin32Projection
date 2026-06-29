#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the header data that must precede the filter data that is defined in the instrumentation manifest.
 * @remarks
 * The filter data that you pass to the provider also includes a header. The
 * following shows an example of how you would define a filter that contained three
 * integers:
 * 
 * ```c
 * struct _MY_FILTER {
 *     EVENT_FILTER_HEADER FilterHeader;
 *     ULONG Int1;
 *     ULONG Int2;
 *     ULONG Int3;
 * } MY_FILTER, *MY_FILTER;
 * 
 * MY_FILTER FilterData;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_filter_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_FILTER_HEADER {
    #StructPack 8

    /**
     * The identifier that identifies the filter in the manifest for a schematized
     * filter. The **value** attribute of the **filter** element contains the
     * identifier.
     */
    Id : UInt16

    /**
     * The version number of the filter for a schematized filter. The **version**
     * attribute of the **filter** element contains the version number.
     */
    Version : Int8

    /**
     * Reserved
     */
    Reserved : Int8[5]

    /**
     * An identifier that identifies the session that passed the filter. ETW sets this
     * value; the session must set this member to zero.
     * 
     * Providers use this value to set the _Filter_ parameter of
     * [EventWriteEx](/windows/desktop/api/evntprov/nf-evntprov-eventwriteex) to
     * prevent the event from being written to the session if the event data does not
     * match the filter criteria (the provider determines the semantics of how the
     * filter data is used in determining whether the event is written to the session).
     */
    InstanceId : Int64

    /**
     * The size, in bytes, of this header and the filter data that is appended to the
     * end of this header.
     */
    Size : UInt32

    /**
     * The offset from the beginning of this filter object to the next filter object.
     * The value is zero if there are no more filter blocks. ETW sets this value; the
     * session must set this member to zero.
     */
    NextOffset : UInt32

}
