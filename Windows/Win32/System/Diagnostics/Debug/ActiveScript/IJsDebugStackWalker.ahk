#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugStackWalker extends IUnknown{
    /**
     * The interface identifier for IJsDebugStackWalker
     * @type {Guid}
     */
    static IID => Guid("{db24b094-73c4-456c-a4ec-e90ea00bdfe3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IJsDebugFrame>} ppFrame 
     * @returns {HRESULT} 
     */
    GetNext(ppFrame) {
        result := ComCall(3, this, "ptr", ppFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
