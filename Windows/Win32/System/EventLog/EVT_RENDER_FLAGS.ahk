#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify what to render.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_render_flags
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_RENDER_FLAGS extends Win32Enum {

    /**
     * Render the event properties specified in the rendering context.
     * Native name: EvtRenderEventValues
     * @type {Integer (UInt32)}
     */
    static EventValues => 0

    /**
     * Render the event as an XML string. For details on the contents of the XML string, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-schema">Event</a> schema.
     * Native name: EvtRenderEventXml
     * @type {Integer (UInt32)}
     */
    static EventXml => 1

    /**
     * Render the bookmark as an XML string, so that you can easily persist the bookmark for use later.
     * Native name: EvtRenderBookmark
     * @type {Integer (UInt32)}
     */
    static Bookmark => 2
}
