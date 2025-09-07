#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_DATA_TEXT.ahk
#Include .\WSMAN_DATA_BINARY.ahk
#Include .\WSMAN_DATA.ahk

/**
 * Represents the output data received from a WSManReceiveShellOutput method.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_receive_data_result
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_RECEIVE_DATA_RESULT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Represents the <b>streamId</b> for which <b>streamData</b> is defined.
     * @type {Pointer<Ptr>}
     */
    streamId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Represents the data associated with <b>streamId</b>. The data can be stream text, binary content, or XML. For more information about the possible data, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a>.
     * @type {WSMAN_DATA}
     */
    streamData{
        get {
            if(!this.HasProp("__streamData"))
                this.__streamData := WSMAN_DATA(this.ptr + 8)
            return this.__streamData
        }
    }

    /**
     * Specifies the status of the command. If this member is set to <b>WSMAN_COMMAND_STATE_DONE</b>, the command should be immediately closed.
     * @type {Pointer<Ptr>}
     */
    commandState {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Defines the exit code of the command. This value is relevant only if the <b>commandState</b> member is set to <b>WSMAN_COMMAND_STATE_DONE</b>.
     * @type {Integer}
     */
    exitCode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
