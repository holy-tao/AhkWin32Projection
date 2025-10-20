#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IProcessDebugManager32 extends IUnknown{
    /**
     * The interface identifier for IProcessDebugManager32
     * @type {Guid}
     */
    static IID => Guid("{51973c2f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDebugApplication32>} ppda 
     * @returns {HRESULT} 
     */
    CreateApplication(ppda) {
        result := ComCall(3, this, "ptr", ppda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication32>} ppda 
     * @returns {HRESULT} 
     */
    GetDefaultApplication(ppda) {
        result := ComCall(4, this, "ptr", ppda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplication32>} pda 
     * @param {Pointer<UInt32>} pdwAppCookie 
     * @returns {HRESULT} 
     */
    AddApplication(pda, pdwAppCookie) {
        result := ComCall(5, this, "ptr", pda, "uint*", pdwAppCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    RemoveApplication(dwAppCookie) {
        result := ComCall(6, this, "uint", dwAppCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkOuter 
     * @param {Pointer<IDebugDocumentHelper32>} pddh 
     * @returns {HRESULT} 
     */
    CreateDebugDocumentHelper(punkOuter, pddh) {
        result := ComCall(7, this, "ptr", punkOuter, "ptr", pddh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
