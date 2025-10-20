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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Delete", "Duplicate", "GetProperties", "GetUiObjectClassId", "Rename"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-connect
     */
    Connect() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-disconnect
     */
    Disconnect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-delete
     */
    Delete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwDuplicateName 
     * @param {Pointer<INetConnection>} ppCon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-duplicate
     */
    Duplicate(pszwDuplicateName, ppCon) {
        pszwDuplicateName := pszwDuplicateName is String ? StrPtr(pszwDuplicateName) : pszwDuplicateName

        result := ComCall(6, this, "ptr", pszwDuplicateName, "ptr*", ppCon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<NETCON_PROPERTIES>>} ppProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-getproperties
     */
    GetProperties(ppProps) {
        result := ComCall(7, this, "ptr*", ppProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-getuiobjectclassid
     */
    GetUiObjectClassId(pclsid) {
        result := ComCall(8, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwNewName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetconnection-rename
     */
    Rename(pszwNewName) {
        pszwNewName := pszwNewName is String ? StrPtr(pszwNewName) : pszwNewName

        result := ComCall(9, this, "ptr", pszwNewName, "HRESULT")
        return result
    }
}
