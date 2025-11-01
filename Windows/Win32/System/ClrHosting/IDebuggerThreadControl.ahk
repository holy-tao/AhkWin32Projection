#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IDebuggerThreadControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebuggerThreadControl
     * @type {Guid}
     */
    static IID => Guid("{23d86786-0bb5-4774-8fb5-e3522add6246}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThreadIsBlockingForDebugger", "ReleaseAllRuntimeThreads", "StartBlockingForDebugger"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForDebugger() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseAllRuntimeThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUnused 
     * @returns {HRESULT} 
     */
    StartBlockingForDebugger(dwUnused) {
        result := ComCall(5, this, "uint", dwUnused, "HRESULT")
        return result
    }
}
