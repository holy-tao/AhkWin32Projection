#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that allow the runtime to disconnect a custom client in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntimeclientext/nn-workspaceruntimeclientext-iworkspaceclientext
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceClientExt extends IUnknown{
    /**
     * The interface identifier for IWorkspaceClientExt
     * @type {Guid}
     */
    static IID => Guid("{12b952f4-41ca-4f21-a829-a6d07d9a16e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} bstrWorkspaceId 
     * @returns {HRESULT} 
     */
    GetResourceId(bstrWorkspaceId) {
        result := ComCall(3, this, "ptr", bstrWorkspaceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrWorkspaceDisplayName 
     * @returns {HRESULT} 
     */
    GetResourceDisplayName(bstrWorkspaceDisplayName) {
        result := ComCall(4, this, "ptr", bstrWorkspaceDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IssueDisconnect() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
