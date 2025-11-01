#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * The IADsSession interface is a dual interface that inherits from IADs. It is designed to represent an active session for file service across a network.
 * @remarks
 * 
  * When a remote user opens resources on a target computer, an active session is established between the remote user and that computer. Many resources can be opened in a single active session. ADSI represents this process with a session object that implements this interface.
  * 
  * Call the methods of this interface to examine session-specific data, for example, who is using the session, which computer is used, and the time elapsed for the current session.
  * 
  * Sessions are managed by the file service. To obtain session objects, first bind to this service ("LanmanServer" or "FPNW").
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadssession
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsSession extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsSession
     * @type {Guid}
     */
    static IID => Guid("{398b7da0-4aab-11cf-ae2c-00aa006ebfb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "get_UserPath", "get_Computer", "get_ComputerPath", "get_ConnectTime", "get_IdleTime"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_User(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_UserPath(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Computer(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ComputerPath(retval) {
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ConnectTime(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_IdleTime(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
