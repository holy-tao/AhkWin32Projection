#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICorConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorConfiguration
     * @type {Guid}
     */
    static IID => Guid("{5c2b07a5-1e98-11d3-872f-00c04f79ed0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGCThreadControl", "SetGCHostControl", "SetDebuggerThreadControl", "AddDebuggerSpecialThread"]

    /**
     * 
     * @param {IGCThreadControl} pGCThreadControl 
     * @returns {HRESULT} 
     */
    SetGCThreadControl(pGCThreadControl) {
        result := ComCall(3, this, "ptr", pGCThreadControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGCHostControl} pGCHostControl 
     * @returns {HRESULT} 
     */
    SetGCHostControl(pGCHostControl) {
        result := ComCall(4, this, "ptr", pGCHostControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebuggerThreadControl} pDebuggerThreadControl 
     * @returns {HRESULT} 
     */
    SetDebuggerThreadControl(pDebuggerThreadControl) {
        result := ComCall(5, this, "ptr", pDebuggerThreadControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSpecialThreadId 
     * @returns {HRESULT} 
     */
    AddDebuggerSpecialThread(dwSpecialThreadId) {
        result := ComCall(6, this, "uint", dwSpecialThreadId, "HRESULT")
        return result
    }
}
