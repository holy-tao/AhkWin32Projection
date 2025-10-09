#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_DATA_TEXT.ahk
#Include .\WSMAN_DATA_BINARY.ahk
#Include .\WSMAN_DATA.ahk
#Include .\WSMAN_RECEIVE_DATA_RESULT.ahk
#Include .\WSMAN_CONNECT_DATA.ahk
#Include .\WSMAN_CREATE_SHELL_DATA.ahk

/**
 * Represents the output data received from a WSMan operation.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_response_data
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_RESPONSE_DATA extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Represents the output data received from a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanreceiveshelloutput">WSManReceiveShellOutput</a> method.
     * @type {WSMAN_RECEIVE_DATA_RESULT}
     */
    receiveData{
        get {
            if(!this.HasProp("__receiveData"))
                this.__receiveData := WSMAN_RECEIVE_DATA_RESULT(this.ptr + 0)
            return this.__receiveData
        }
    }

    /**
     * Represents the output data received from a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanconnectshell">WSManConnectShell</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanconnectshellcommand">WSManConnectShellCommand</a> method.
     * @type {WSMAN_CONNECT_DATA}
     */
    connectData{
        get {
            if(!this.HasProp("__connectData"))
                this.__connectData := WSMAN_CONNECT_DATA(this.ptr + 0)
            return this.__connectData
        }
    }

    /**
     * 
     * @type {WSMAN_CREATE_SHELL_DATA}
     */
    createData{
        get {
            if(!this.HasProp("__createData"))
                this.__createData := WSMAN_CREATE_SHELL_DATA(this.ptr + 0)
            return this.__createData
        }
    }
}
