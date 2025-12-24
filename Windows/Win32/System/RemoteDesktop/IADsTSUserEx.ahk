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
     * @type {BSTR} 
     */
    TerminalServicesProfilePath {
        get => this.get_TerminalServicesProfilePath()
        set => this.put_TerminalServicesProfilePath(value)
    }

    /**
     * @type {BSTR} 
     */
    TerminalServicesHomeDirectory {
        get => this.get_TerminalServicesHomeDirectory()
        set => this.put_TerminalServicesHomeDirectory(value)
    }

    /**
     * @type {BSTR} 
     */
    TerminalServicesHomeDrive {
        get => this.get_TerminalServicesHomeDrive()
        set => this.put_TerminalServicesHomeDrive(value)
    }

    /**
     * @type {Integer} 
     */
    AllowLogon {
        get => this.get_AllowLogon()
        set => this.put_AllowLogon(value)
    }

    /**
     * @type {Integer} 
     */
    EnableRemoteControl {
        get => this.get_EnableRemoteControl()
        set => this.put_EnableRemoteControl(value)
    }

    /**
     * @type {Integer} 
     */
    MaxDisconnectionTime {
        get => this.get_MaxDisconnectionTime()
        set => this.put_MaxDisconnectionTime(value)
    }

    /**
     * @type {Integer} 
     */
    MaxConnectionTime {
        get => this.get_MaxConnectionTime()
        set => this.put_MaxConnectionTime(value)
    }

    /**
     * @type {Integer} 
     */
    MaxIdleTime {
        get => this.get_MaxIdleTime()
        set => this.put_MaxIdleTime(value)
    }

    /**
     * @type {Integer} 
     */
    ReconnectionAction {
        get => this.get_ReconnectionAction()
        set => this.put_ReconnectionAction(value)
    }

    /**
     * @type {Integer} 
     */
    BrokenConnectionAction {
        get => this.get_BrokenConnectionAction()
        set => this.put_BrokenConnectionAction(value)
    }

    /**
     * @type {Integer} 
     */
    ConnectClientDrivesAtLogon {
        get => this.get_ConnectClientDrivesAtLogon()
        set => this.put_ConnectClientDrivesAtLogon(value)
    }

    /**
     * @type {Integer} 
     */
    ConnectClientPrintersAtLogon {
        get => this.get_ConnectClientPrintersAtLogon()
        set => this.put_ConnectClientPrintersAtLogon(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultToMainPrinter {
        get => this.get_DefaultToMainPrinter()
        set => this.put_DefaultToMainPrinter(value)
    }

    /**
     * @type {BSTR} 
     */
    TerminalServicesWorkDirectory {
        get => this.get_TerminalServicesWorkDirectory()
        set => this.put_TerminalServicesWorkDirectory(value)
    }

    /**
     * @type {BSTR} 
     */
    TerminalServicesInitialProgram {
        get => this.get_TerminalServicesInitialProgram()
        set => this.put_TerminalServicesInitialProgram(value)
    }

    /**
     * The roaming or mandatory profile path to be used when the user logs on to the Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * 
     * The profile path is 
     *      in the following network path format:
     * 
     * <b>\\\\</b><i>ServerName</i><b>\\</b><i>ProfilesFolderName</i><b>\\</b><i>UserName</i>
     * 
     * <div class="alert"><b>Note</b>  A Remote Desktop Services profile path is used only for logging on to an RD Session Host server.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesprofilepath
     */
    get_TerminalServicesProfilePath() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The roaming or mandatory profile path to be used when the user logs on to the Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * 
     * The profile path is 
     *      in the following network path format:
     * 
     * <b>\\\\</b><i>ServerName</i><b>\\</b><i>ProfilesFolderName</i><b>\\</b><i>UserName</i>
     * 
     * <div class="alert"><b>Note</b>  A Remote Desktop Services profile path is used only for logging on to an RD Session Host server.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesprofilepath
     */
    put_TerminalServicesProfilePath(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(8, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * The root directory for the user. Each user on a Remote Desktop Session Host (RD Session Host) server has a unique root directory. This ensures that application information is stored separately for each user in a multiuser environment.
     * @remarks
     * 
     * To set a root directory on the local computer, specify a local path; for example, C:\Path. To set a root directory in a network environment, you must first set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedrive">TerminalServicesHomeDrive</a> property, and then set this property to a UNC path.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedirectory
     */
    get_TerminalServicesHomeDirectory() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The root directory for the user. Each user on a Remote Desktop Session Host (RD Session Host) server has a unique root directory. This ensures that application information is stored separately for each user in a multiuser environment.
     * @remarks
     * 
     * To set a root directory on the local computer, specify a local path; for example, C:\Path. To set a root directory in a network environment, you must first set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedrive">TerminalServicesHomeDrive</a> property, and then set this property to a UNC path.
     * 
     * 
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_terminalserviceshomedirectory
     */
    put_TerminalServicesHomeDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(10, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * The root drive for the user. In a network environment, this property is a string that contains a drive specification (a drive letter followed by a colon) to which the UNC path specified as the root directory is mapped.
     * @remarks
     * 
     * To set a root directory in a network environment, you must first set this property and then set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedirectory">TerminalServicesHomeDirectory</a> property.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedrive
     */
    get_TerminalServicesHomeDrive() {
        pVal := BSTR()
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The root drive for the user. In a network environment, this property is a string that contains a drive specification (a drive letter followed by a colon) to which the UNC path specified as the root directory is mapped.
     * @remarks
     * 
     * To set a root directory in a network environment, you must first set this property and then set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalserviceshomedirectory">TerminalServicesHomeDirectory</a> property.
     * 
     * 
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_terminalserviceshomedrive
     */
    put_TerminalServicesHomeDrive(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(12, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies whether the user is allowed to log on to the Remote Desktop Session Host (RD Session Host) server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_allowlogon
     */
    get_AllowLogon() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * A value that specifies whether the user is allowed to log on to the Remote Desktop Session Host (RD Session Host) server.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_allowlogon
     */
    put_AllowLogon(NewVal) {
        result := ComCall(14, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies whether to allow remote observation or remote control of the user's Remote Desktop Services session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_enableremotecontrol
     */
    get_EnableRemoteControl() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * A value that specifies whether to allow remote observation or remote control of the user's Remote Desktop Services session.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_enableremotecontrol
     */
    put_EnableRemoteControl(NewVal) {
        result := ComCall(16, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * The maximum amount of time that a disconnected Remote Desktop Services session remains active on the Remote Desktop Session Host (RD Session Host) server. After the specified number of minutes have elapsed, the session is terminated.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_maxdisconnectiontime
     */
    get_MaxDisconnectionTime() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The maximum amount of time that a disconnected Remote Desktop Services session remains active on the Remote Desktop Session Host (RD Session Host) server. After the specified number of minutes have elapsed, the session is terminated.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_maxdisconnectiontime
     */
    put_MaxDisconnectionTime(NewVal) {
        result := ComCall(18, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * The maximum duration of the Remote Desktop Services session. After the specified number of minutes have elapsed, the session can be disconnected or terminated.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_maxconnectiontime
     */
    get_MaxConnectionTime() {
        result := ComCall(19, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The maximum duration of the Remote Desktop Services session. After the specified number of minutes have elapsed, the session can be disconnected or terminated.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_maxconnectiontime
     */
    put_MaxConnectionTime(NewVal) {
        result := ComCall(20, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * The maximum amount of time that the Remote Desktop Services session can remain idle. After the specified number of minutes has elapsed, the session can be disconnected or terminated.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_maxidletime
     */
    get_MaxIdleTime() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The maximum amount of time that the Remote Desktop Services session can remain idle. After the specified number of minutes has elapsed, the session can be disconnected or terminated.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_maxidletime
     */
    put_MaxIdleTime(NewVal) {
        result := ComCall(22, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies if reconnection to a disconnected Remote Desktop Services session is allowed.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_reconnectionaction
     */
    get_ReconnectionAction() {
        result := ComCall(23, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * A value that specifies if reconnection to a disconnected Remote Desktop Services session is allowed.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_reconnectionaction
     */
    put_ReconnectionAction(NewVal) {
        result := ComCall(24, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies the action to take when a Remote Desktop Services session limit is reached.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_brokenconnectionaction
     */
    get_BrokenConnectionAction() {
        result := ComCall(25, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * A value that specifies the action to take when a Remote Desktop Services session limit is reached.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_brokenconnectionaction
     */
    put_BrokenConnectionAction(NewVal) {
        result := ComCall(26, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies if mapped client drives should be reconnected when a Remote Desktop Services session is started.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_connectclientdrivesatlogon
     */
    get_ConnectClientDrivesAtLogon() {
        result := ComCall(27, this, "int*", &pNewVal := 0, "HRESULT")
        return pNewVal
    }

    /**
     * A value that specifies if mapped client drives should be reconnected when a Remote Desktop Services session is started.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_connectclientdrivesatlogon
     */
    put_ConnectClientDrivesAtLogon(NewVal) {
        result := ComCall(28, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies whether to reconnect to mapped client printers at logon.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_connectclientprintersatlogon
     */
    get_ConnectClientPrintersAtLogon() {
        result := ComCall(29, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * A value that specifies whether to reconnect to mapped client printers at logon.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_connectclientprintersatlogon
     */
    put_ConnectClientPrintersAtLogon(NewVal) {
        result := ComCall(30, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * A value that specifies whether to print automatically to the client's default printer.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_defaulttomainprinter
     */
    get_DefaultToMainPrinter() {
        result := ComCall(31, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * A value that specifies whether to print automatically to the client's default printer.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_defaulttomainprinter
     */
    put_DefaultToMainPrinter(NewVal) {
        result := ComCall(32, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * The working directory path for the user.
     * @remarks
     * 
     * To set an initial application to start when the user logs on to the Remote Desktop Session Host (RD Session Host) server, you must first set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesinitialprogram">TerminalServicesInitialProgram</a> property, and then set this property.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesworkdirectory
     */
    get_TerminalServicesWorkDirectory() {
        pVal := BSTR()
        result := ComCall(33, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The working directory path for the user.
     * @remarks
     * 
     * To set an initial application to start when the user logs on to the Remote Desktop Session Host (RD Session Host) server, you must first set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesinitialprogram">TerminalServicesInitialProgram</a> property, and then set this property.
     * 
     * 
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesworkdirectory
     */
    put_TerminalServicesWorkDirectory(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(34, this, "ptr", pNewVal, "HRESULT")
        return result
    }

    /**
     * The path and file name of the application that the user wants to start automatically when the user logs on to the Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * 
     * To set an initial application to start when the user logs on, you must first set this property and then set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesworkdirectory">TerminalServicesWorkDirectory</a> property. If you set only the <b>TerminalServicesInitialProgram</b> property, the application starts in the user's session in the default user directory.
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesinitialprogram
     */
    get_TerminalServicesInitialProgram() {
        pVal := BSTR()
        result := ComCall(35, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * The path and file name of the application that the user wants to start automatically when the user logs on to the Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * 
     * To set an initial application to start when the user logs on, you must first set this property and then set the <a href="https://docs.microsoft.com/windows/desktop/api/tsuserex/nf-tsuserex-iadstsuserex-get_terminalservicesworkdirectory">TerminalServicesWorkDirectory</a> property. If you set only the <b>TerminalServicesInitialProgram</b> property, the application starts in the user's session in the default user directory.
     * 
     * 
     * 
     * @param {BSTR} pNewVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//tsuserex/nf-tsuserex-iadstsuserex-put_terminalservicesinitialprogram
     */
    put_TerminalServicesInitialProgram(pNewVal) {
        pNewVal := pNewVal is String ? BSTR.Alloc(pNewVal).Value : pNewVal

        result := ComCall(36, this, "ptr", pNewVal, "HRESULT")
        return result
    }
}
