#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to examine and configure Remote Desktop Services user properties.
 * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nn-tsuserex-iadstsuserex
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IADsTSUserEx extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsTSUserEx
     * @type {Guid}
     */
    static IID => Guid("{c4930e79-2989-4462-8a60-2fcf2f2955ef}")

    /**
     * The class identifier for ADsTSUserEx
     * @type {Guid}
     */
    static CLSID => Guid("{e2e9cae6-1e7b-4b8e-babd-e9bf6292ac29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TerminalServicesProfilePath", "put_TerminalServicesProfilePath", "get_TerminalServicesHomeDirectory", "put_TerminalServicesHomeDirectory", "get_TerminalServicesHomeDrive", "put_TerminalServicesHomeDrive", "get_AllowLogon", "put_AllowLogon", "get_EnableRemoteControl", "put_EnableRemoteControl", "get_MaxDisconnectionTime", "put_MaxDisconnectionTime", "get_MaxConnectionTime", "put_MaxConnectionTime", "get_MaxIdleTime", "put_MaxIdleTime", "get_ReconnectionAction", "put_ReconnectionAction", "get_BrokenConnectionAction", "put_BrokenConnectionAction", "get_ConnectClientDrivesAtLogon", "put_ConnectClientDrivesAtLogon", "get_ConnectClientPrintersAtLogon", "put_ConnectClientPrintersAtLogon", "get_DefaultToMainPrinter", "put_DefaultToMainPrinter", "get_TerminalServicesWorkDirectory", "put_TerminalServicesWorkDirectory", "get_TerminalServicesInitialProgram", "put_TerminalServicesInitialProgram"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesprofilepath
     */
    get_TerminalServicesProfilePath() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesprofilepath
     */
    put_TerminalServicesProfilePath(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(8, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedirectory
     */
    get_TerminalServicesHomeDirectory() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_terminalserviceshomedirectory
     */
    put_TerminalServicesHomeDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(10, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedrive
     */
    get_TerminalServicesHomeDrive() {
        pVal := BSTR()
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_terminalserviceshomedrive
     */
    put_TerminalServicesHomeDrive(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(12, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_allowlogon
     */
    get_AllowLogon() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_allowlogon
     */
    put_AllowLogon(NewVal) {
        result := ComCall(14, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_enableremotecontrol
     */
    get_EnableRemoteControl() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_enableremotecontrol
     */
    put_EnableRemoteControl(NewVal) {
        result := ComCall(16, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_maxdisconnectiontime
     */
    get_MaxDisconnectionTime() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_maxdisconnectiontime
     */
    put_MaxDisconnectionTime(NewVal) {
        result := ComCall(18, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_maxconnectiontime
     */
    get_MaxConnectionTime() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_maxconnectiontime
     */
    put_MaxConnectionTime(NewVal) {
        result := ComCall(20, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_maxidletime
     */
    get_MaxIdleTime() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_maxidletime
     */
    put_MaxIdleTime(NewVal) {
        result := ComCall(22, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_reconnectionaction
     */
    get_ReconnectionAction() {
        result := ComCall(23, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_reconnectionaction
     */
    put_ReconnectionAction(NewVal) {
        result := ComCall(24, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_brokenconnectionaction
     */
    get_BrokenConnectionAction() {
        result := ComCall(25, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_brokenconnectionaction
     */
    put_BrokenConnectionAction(NewVal) {
        result := ComCall(26, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_connectclientdrivesatlogon
     */
    get_ConnectClientDrivesAtLogon() {
        result := ComCall(27, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_connectclientdrivesatlogon
     */
    put_ConnectClientDrivesAtLogon(NewVal) {
        result := ComCall(28, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_connectclientprintersatlogon
     */
    get_ConnectClientPrintersAtLogon() {
        result := ComCall(29, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_connectclientprintersatlogon
     */
    put_ConnectClientPrintersAtLogon(NewVal) {
        result := ComCall(30, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_defaulttomainprinter
     */
    get_DefaultToMainPrinter() {
        result := ComCall(31, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_defaulttomainprinter
     */
    put_DefaultToMainPrinter(NewVal) {
        result := ComCall(32, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesworkdirectory
     */
    get_TerminalServicesWorkDirectory() {
        pVal := BSTR()
        result := ComCall(33, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesworkdirectory
     */
    put_TerminalServicesWorkDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(34, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesinitialprogram
     */
    get_TerminalServicesInitialProgram() {
        pVal := BSTR()
        result := ComCall(35, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesinitialprogram
     */
    put_TerminalServicesInitialProgram(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(36, this, "ptr", pNewVal, "HRESULT")
        return result
    }
}
