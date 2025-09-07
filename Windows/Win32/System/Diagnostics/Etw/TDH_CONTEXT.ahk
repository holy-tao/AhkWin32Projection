#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the additional information required to parse an event.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-tdh_context
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TDH_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Context value cast to a ULONGLONG. The context value is determined by the context type specified in <b>ParameterType</b>. For example, if the context type is TDH_CONTEXT_WPP_TMFFILE, the context value is a Unicode string that contains the name of the .tmf file.
     * @type {Integer}
     */
    ParameterValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Context type. For a list of types, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-tdh_context_type">TDH_CONTEXT_TYPE</a> enumeration.
     * @type {Integer}
     */
    ParameterType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    ParameterSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
