#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugCodeContext extends IUnknown{
    /**
     * The interface identifier for IDebugCodeContext
     * @type {Guid}
     */
    static IID => Guid("{51973c13-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDebugDocumentContext>} ppsc 
     * @returns {HRESULT} 
     */
    GetDocumentContext(ppsc) {
        result := ComCall(3, this, "ptr", ppsc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bps 
     * @returns {HRESULT} 
     */
    SetBreakPoint(bps) {
        result := ComCall(4, this, "int", bps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
