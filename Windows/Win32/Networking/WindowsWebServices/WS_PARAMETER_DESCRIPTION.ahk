#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The index of the parameters in the incoming/outgoing messages field descriptions.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_parameter_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_PARAMETER_DESCRIPTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of the parameter.
     * @type {Integer}
     */
    parameterType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value between 0 and MAX_SHORT - 1 that represents the index of the field 
     *                     in the input <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is MAX_USHORT if it has not present in the input
     *                     WS_MESSAGE.
     * @type {Integer}
     */
    inputMessageIndex {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A value between 0 and MAX_SHORT - 1 that represents the index of the field 
     *                     in the output <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is MAX_USHORT if it has not present in the output
     *                     WS_MESSAGE.
     * @type {Integer}
     */
    outputMessageIndex {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
