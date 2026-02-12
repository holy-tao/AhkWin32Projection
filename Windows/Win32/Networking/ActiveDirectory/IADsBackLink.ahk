#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsBackLink interface provides methods for an ADSI client to access the Back Link attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadsbacklink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsBackLink extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsBackLink
     * @type {Guid}
     */
    static IID => Guid("{fd1302bd-4080-11d1-a3ac-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteID", "put_RemoteID", "get_ObjectName", "put_ObjectName"]

    /**
     * @type {Integer} 
     */
    RemoteID {
        get => this.get_RemoteID()
        set => this.put_RemoteID(value)
    }

    /**
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteID() {
        result := ComCall(7, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnRemoteID 
     * @returns {HRESULT} 
     */
    put_RemoteID(lnRemoteID) {
        result := ComCall(8, this, "int", lnRemoteID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        if(bstrObjectName is String) {
            pin := BSTR.Alloc(bstrObjectName)
            bstrObjectName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrObjectName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
