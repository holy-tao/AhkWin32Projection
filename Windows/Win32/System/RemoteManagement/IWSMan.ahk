#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides methods and properties used to create a session, represented by a Session object.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsman
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSMan extends IDispatch {
    /**
     * The interface identifier for IWSMan
     * @type {Guid}
     */
    static IID := Guid("{190d8637-5cd3-496d-ad24-69636bb5a3b5}")

    /**
     * The class identifier for WSMan
     * @type {Guid}
     */
    static CLSID := Guid("{bced617b-ec03-420b-8508-977dc7a686bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSMan interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateSession           : IntPtr
        CreateConnectionOptions : IntPtr
        get_CommandLine         : IntPtr
        get_Error               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSMan.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The following list contains examples of formats used to specify connection information in the <i>connection</i> parameter (when creating an HTTPS session, the &lt;<i>Address</i>&gt; field must match the server computer certificate name, otherwise a failure occurs):
     * 
     * <ul>
     * <li>
     * "https://service"
     * 
     * Uses HTTPS to connect to the default web service location.
     * 
     * </li>
     * <li>
     * "https://service.corp.com/websvcs/wsman"
     * 
     * Uses HTTPS to connect to the specific web service location.
     * 
     * </li>
     * <li>
     * "https://[E3D7:0000:0000:0000:51F4:9BC8:C0A8:6420]"
     * 
     * Uses HTTPS and IPv6 with the default port.
     * 
     * </li>
     * <li>
     * "https://[E3D7:0000:0000:0000:51F4:9BC8:C0A8:6420]:9999/wsman"
     * 
     * Uses HTTPS and IPv6 with the given port.
     * 
     * </li>
     * </ul>
     * @param {BSTR} _connection The protocol and service to connect to, including either IPv4 or IPv6. The format of the connection information is as follows: &lt;<i>Transport</i>&gt;&lt;<i>Address</i>&gt;&lt;<i>Suffix</i>&gt;. For examples, see Remarks. If no connection information is provided, the local computer is used.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-createsession
     */
    CreateSession(_connection, flags, connectionOptions) {
        _connection := _connection is String ? BSTR.Alloc(_connection).Value : _connection

        result := ComCall(7, this, BSTR, _connection, "int", flags, "ptr", connectionOptions, "ptr*", &session := 0, "HRESULT")
        return IDispatch(session)
    }

    /**
     * Creates an IWSManConnectionOptions object that specifies the user name and password used when creating a session.
     * @returns {IDispatch} A pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptions">IWSManConnectionOptions</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-createconnectionoptions
     */
    CreateConnectionOptions() {
        result := ComCall(8, this, "ptr*", &connectionOptions := 0, "HRESULT")
        return IDispatch(connectionOptions)
    }

    /**
     * Gets the command line of the process that loads the automation component.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-get_commandline
     */
    get_CommandLine() {
        value := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Gets additional error information, in an XML stream, for the preceding call to an IWSMan method if Windows Remote Management service was unable to create an IWSManSession object, an IWSManConnectionOptions object, or an IWSManResourceLocator object.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-get_error
     */
    get_Error() {
        value := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWSMan.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 5)
        this.vtbl.CreateConnectionOptions := CallbackCreate(GetMethod(implObj, "CreateConnectionOptions"), flags, 2)
        this.vtbl.get_CommandLine := CallbackCreate(GetMethod(implObj, "get_CommandLine"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSession)
        CallbackFree(this.vtbl.CreateConnectionOptions)
        CallbackFree(this.vtbl.get_CommandLine)
        CallbackFree(this.vtbl.get_Error)
    }
}
