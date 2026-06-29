#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the values that specify what to render.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_render_flags
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_RENDER_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Render the event properties specified in the rendering context.
     * @type {Integer (UInt32)}
     */
    static EvtRenderEventValues => 0

    /**
     * Render the event as an XML string. For details on the contents of the XML string, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-schema">Event</a> schema.
     * @type {Integer (UInt32)}
     */
    static EvtRenderEventXml => 1

    /**
     * Render the bookmark as an XML string, so that you can easily persist the bookmark for use later.
     * @type {Integer (UInt32)}
     */
    static EvtRenderBookmark => 2
}
