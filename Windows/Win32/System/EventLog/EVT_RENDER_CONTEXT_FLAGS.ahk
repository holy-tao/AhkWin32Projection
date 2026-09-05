#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify the type of information to access from the event.
 * @remarks
 * You cannot specify the EvtRenderContextValues flag with the EvtRenderContextSystem or EvtRenderContextUser flag.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_render_context_flags
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_RENDER_CONTEXT_FLAGS extends Win32Enum {

    /**
     * Render specific properties from the event.
     * Native name: EvtRenderContextValues
     * @type {Integer (UInt32)}
     */
    static Values => 0

    /**
     * Render the system properties under the <b>System</b> element. The properties are returned in the order defined in the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_system_property_id">EVT_SYSTEM_PROPERTY_ID</a> enumeration.
     * Native name: EvtRenderContextSystem
     * @type {Integer (UInt32)}
     */
    static System => 1

    /**
     * Render all user-defined properties under the <b>UserData</b> or <b>EventData</b> element. If the data template associated with the event contains a <b>UserData</b> section, the <b>UserData</b> properties are rendered; otherwise, the <b>EventData</b> properties are rendered.
     * Native name: EvtRenderContextUser
     * @type {Integer (UInt32)}
     */
    static User => 2
}
