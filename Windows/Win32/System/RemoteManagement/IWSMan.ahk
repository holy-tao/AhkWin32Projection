#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods and properties used to create a session, represented by a Session object.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsman
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSMan extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSMan
     * @type {Guid}
     */
    static IID => Guid("{190d8637-5cd3-496d-ad24-69636bb5a3b5}")

    /**
     * The class identifier for WSMan
     * @type {Guid}
     */
    static CLSID => Guid("{bced617b-ec03-420b-8508-977dc7a686bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSession", "CreateConnectionOptions", "get_CommandLine", "get_Error"]

    /**
     * @type {BSTR} 
     */
    CommandLine {
        get => this.get_CommandLine()
    }

    /**
     * @type {BSTR} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Creates a Session object that can then be used for subsequent network operations.
     * @param {BSTR} connection The protocol and service to connect to, including either IPv4 or IPv6. The format of the connection information is as follows: &lt;<i>Transport</i>&gt;&lt;<i>Address</i>&gt;&lt;<i>Suffix</i>&gt;. For examples, see Remarks. If no connection information is provided, the local computer is used.
     * @param {Integer} flags The session flags that specify the authentication method, such as 
     *      <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Negotiate authentication</a> 
     *      or 
     *      <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Digest authentication</a>, 
     *      for connecting to a remote computer. These flags also specify other session connection information, such as 
     *      encoding or encryption. This parameter must contain one or more of the flags in 
     *      <b>__WSManSessionFlags</b> for a remote connection. For more information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-constants">Session Constants</a>. No flag settings are required for a 
     *      connection to the WinRM service on the local computer.
     * 
     * If no  authentication flags are specified, Kerberos is used unless one of the following conditions is true, 
     *      in which case Negotiate is used:
     * 
     * <ul>
     * <li>explicit credentials are supplied and the destination host is trusted</li>
     * <li>the destination host is "localhost", "127.0.0.1" or "[::1]"</li>
     * <li>the client computer is in a workgroup and the destination host is trusted</li>
     * </ul>
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/authentication-for-remote-connections">Authentication for Remote Connections</a> and the <i>connectionOptions</i> parameter.
     * @param {IDispatch} connectionOptions A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptions">IWSManConnectionOptions</a> object that contains a user name and password. The default is <b>NULL</b>.
     * @returns {IDispatch} A pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmansession">IWSManSession</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsman-createsession
     */
    CreateSession(connection, flags, connectionOptions) {
        connection := connection is String ? BSTR.Alloc(connection).Value : connection

        result := ComCall(7, this, "ptr", connection, "int", flags, "ptr", connectionOptions, "ptr*", &session := 0, "HRESULT")
        return IDispatch(session)
    }

    /**
     * Creates an IWSManConnectionOptions object that specifies the user name and password used when creating a session.
     * @returns {IDispatch} A pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptions">IWSManConnectionOptions</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsman-createconnectionoptions
     */
    CreateConnectionOptions() {
        result := ComCall(8, this, "ptr*", &connectionOptions := 0, "HRESULT")
        return IDispatch(connectionOptions)
    }

    /**
     * Gets the command line of the process that loads the automation component.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsman-get_commandline
     */
    get_CommandLine() {
        value := BSTR()
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * Gets additional error information, in an XML stream, for the preceding call to an IWSMan method if Windows Remote Management service was unable to create an IWSManSession object, an IWSManConnectionOptions object, or an IWSManResourceLocator object.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsman-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return value
    }
}
