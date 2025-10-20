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
     * 
     * @param {BSTR} connection 
     * @param {Integer} flags 
     * @param {Pointer<IDispatch>} connectionOptions 
     * @param {Pointer<IDispatch>} session 
     * @returns {HRESULT} 
     */
    CreateSession(connection, flags, connectionOptions, session) {
        connection := connection is String ? BSTR.Alloc(connection).Value : connection

        result := ComCall(7, this, "ptr", connection, "int", flags, "ptr", connectionOptions, "ptr", session, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} connectionOptions 
     * @returns {HRESULT} 
     */
    CreateConnectionOptions(connectionOptions) {
        result := ComCall(8, this, "ptr", connectionOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_CommandLine(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_Error(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
