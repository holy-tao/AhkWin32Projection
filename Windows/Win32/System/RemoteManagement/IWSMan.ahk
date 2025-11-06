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
     * 
     * @param {BSTR} connection 
     * @param {Integer} flags 
     * @param {IDispatch} connectionOptions 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-createsession
     */
    CreateSession(connection, flags, connectionOptions) {
        connection := connection is String ? BSTR.Alloc(connection).Value : connection

        result := ComCall(7, this, "ptr", connection, "int", flags, "ptr", connectionOptions, "ptr*", &session := 0, "HRESULT")
        return IDispatch(session)
    }

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-createconnectionoptions
     */
    CreateConnectionOptions() {
        result := ComCall(8, this, "ptr*", &connectionOptions := 0, "HRESULT")
        return IDispatch(connectionOptions)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-get_commandline
     */
    get_CommandLine() {
        value := BSTR()
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsman-get_error
     */
    get_Error() {
        value := BSTR()
        result := ComCall(10, this, "ptr", value, "HRESULT")
        return value
    }
}
