#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_CREATE_SHELL_DATA.ahk" { WSMAN_CREATE_SHELL_DATA }
#Import ".\WSMAN_DATA_TEXT.ahk" { WSMAN_DATA_TEXT }
#Import ".\WSManDataType.ahk" { WSManDataType }
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import ".\WSMAN_RECEIVE_DATA_RESULT.ahk" { WSMAN_RECEIVE_DATA_RESULT }
#Import ".\WSMAN_DATA_BINARY.ahk" { WSMAN_DATA_BINARY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_CONNECT_DATA.ahk" { WSMAN_CONNECT_DATA }

/**
 * Represents the output data received from a WSMan operation.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_response_data
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_RESPONSE_DATA {
    #StructPack 8

    /**
     * Represents the output data received from a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanreceiveshelloutput">WSManReceiveShellOutput</a> method.
     */
    receiveData : WSMAN_RECEIVE_DATA_RESULT

    static __New() {
        DefineProp(this.Prototype, 'connectData', { type: WSMAN_CONNECT_DATA, offset: 0 })
        DefineProp(this.Prototype, 'createData', { type: WSMAN_CREATE_SHELL_DATA, offset: 0 })
        this.DeleteProp("__New")
    }
}
