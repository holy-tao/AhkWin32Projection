#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_DATA_BINARY.ahk" { WSMAN_DATA_BINARY }
#Import ".\WSManDataType.ahk" { WSManDataType }
#Import ".\WSMAN_DATA_TEXT.ahk" { WSMAN_DATA_TEXT }

/**
 * Contains inbound and outbound data used in the Windows Remote Management (WinRM) API.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_data
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_DATA {
    #StructPack 8

    /**
     * Specifies the type of data currently stored in the union.
     */
    type : WSManDataType

    text : WSMAN_DATA_TEXT

    static __New() {
        DefineProp(this.Prototype, 'binaryData', { type: WSMAN_DATA_BINARY, offset: 8 })
        DefineProp(this.Prototype, 'number', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
