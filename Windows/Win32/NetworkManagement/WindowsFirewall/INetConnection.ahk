#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INetConnection interface provides methods to manage network connections.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetconnection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetConnection extends IUnknown{
    /**
     * The interface identifier for INetConnection
     * @type {Guid}
     */
    static IID => Guid("{c08956a1-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwDuplicateName 
     * @param {Pointer<INetConnection>} ppCon 
     * @returns {HRESULT} 
     */
    Duplicate(pszwDuplicateName, ppCon) {
        pszwDuplicateName := pszwDuplicateName is String ? StrPtr(pszwDuplicateName) : pszwDuplicateName

        result := ComCall(6, this, "ptr", pszwDuplicateName, "ptr", ppCon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<NETCON_PROPERTIES>} ppProps 
     * @returns {HRESULT} 
     */
    GetProperties(ppProps) {
        result := ComCall(7, this, "ptr", ppProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetUiObjectClassId(pclsid) {
        result := ComCall(8, this, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwNewName 
     * @returns {HRESULT} 
     */
    Rename(pszwNewName) {
        pszwNewName := pszwNewName is String ? StrPtr(pszwNewName) : pszwNewName

        result := ComCall(9, this, "ptr", pszwNewName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
