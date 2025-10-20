#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRDebugManager extends IUnknown{
    /**
     * The interface identifier for ICLRDebugManager
     * @type {Guid}
     */
    static IID => Guid("{00dcaec6-2ac0-43a9-acf9-1e36c139b10d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwConnectionId 
     * @param {PWSTR} szConnectionName 
     * @returns {HRESULT} 
     */
    BeginConnection(dwConnectionId, szConnectionName) {
        szConnectionName := szConnectionName is String ? StrPtr(szConnectionName) : szConnectionName

        result := ComCall(3, this, "uint", dwConnectionId, "ptr", szConnectionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} dwCount 
     * @param {Pointer<ICLRTask>} ppCLRTask 
     * @returns {HRESULT} 
     */
    SetConnectionTasks(id, dwCount, ppCLRTask) {
        result := ComCall(4, this, "uint", id, "uint", dwCount, "ptr", ppCLRTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnectionId 
     * @returns {HRESULT} 
     */
    EndConnection(dwConnectionId) {
        result := ComCall(5, this, "uint", dwConnectionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} pacl 
     * @returns {HRESULT} 
     */
    SetDacl(pacl) {
        result := ComCall(6, this, "ptr", pacl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} pacl 
     * @returns {HRESULT} 
     */
    GetDacl(pacl) {
        result := ComCall(7, this, "ptr", pacl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAttached 
     * @returns {HRESULT} 
     */
    IsDebuggerAttached(pbAttached) {
        result := ComCall(8, this, "ptr", pbAttached, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     */
    SetSymbolReadingPolicy(policy) {
        result := ComCall(9, this, "int", policy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
