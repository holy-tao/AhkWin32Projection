#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IMachineDebugManagerCookie extends IUnknown{
    /**
     * The interface identifier for IMachineDebugManagerCookie
     * @type {Guid}
     */
    static IID => Guid("{51973c2d-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRemoteDebugApplication>} pda 
     * @param {Integer} dwDebugAppCookie 
     * @param {Pointer<UInt32>} pdwAppCookie 
     * @returns {HRESULT} 
     */
    AddApplication(pda, dwDebugAppCookie, pdwAppCookie) {
        result := ComCall(3, this, "ptr", pda, "uint", dwDebugAppCookie, "uint*", pdwAppCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDebugAppCookie 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    RemoveApplication(dwDebugAppCookie, dwAppCookie) {
        result := ComCall(4, this, "uint", dwDebugAppCookie, "uint", dwAppCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRemoteDebugApplications>} ppeda 
     * @returns {HRESULT} 
     */
    EnumApplications(ppeda) {
        result := ComCall(5, this, "ptr", ppeda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
