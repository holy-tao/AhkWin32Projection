#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\PrintTicket\WorkflowPrintTicket.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PrintSupportSessionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportSettingsUISession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportSettingsUISession
     * @type {Guid}
     */
    static IID => Guid("{c6da2251-83c3-55e4-a0f8-5de8b062adbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionPrintTicket", "get_DocumentTitle", "get_LaunchKind", "UpdatePrintTicket", "get_SessionInfo"]

    /**
     * @type {WorkflowPrintTicket} 
     */
    SessionPrintTicket {
        get => this.get_SessionPrintTicket()
    }

    /**
     * @type {HSTRING} 
     */
    DocumentTitle {
        get => this.get_DocumentTitle()
    }

    /**
     * @type {Integer} 
     */
    LaunchKind {
        get => this.get_LaunchKind()
    }

    /**
     * @type {PrintSupportSessionInfo} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

    /**
     * 
     * @returns {WorkflowPrintTicket} 
     */
    get_SessionPrintTicket() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DocumentTitle() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {WorkflowPrintTicket} printTicket 
     * @returns {HRESULT} 
     */
    UpdatePrintTicket(printTicket) {
        result := ComCall(9, this, "ptr", printTicket, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PrintSupportSessionInfo} 
     */
    get_SessionInfo() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintSupportSessionInfo(value)
    }
}
