#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constant values that indicates the layout of the event data.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-template_flags
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TEMPLATE_FLAGS extends Win32Enum {

    /**
     * The layout of the event data is determined by the order of the data items defined in the event data template definition.
     * Native name: TEMPLATE_EVENT_DATA
     * @type {Integer (Int32)}
     */
    static EVENT_DATA => 1

    /**
     * The layout of the event data is determined by the XML fragment included in the event data template definition.
     * Native name: TEMPLATE_USER_DATA
     * @type {Integer (Int32)}
     */
    static USER_DATA => 2

    /**
     * Native name: TEMPLATE_CONTROL_GUID
     * @type {Integer (Int32)}
     */
    static CONTROL_GUID => 4
}
