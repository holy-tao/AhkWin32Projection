#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IDebuggerThreadControl extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForDebugger() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseAllRuntimeThreads() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwUnused 
     * @returns {HRESULT} 
     */
    StartBlockingForDebugger(dwUnused) {
        result := ComCall(5, this, "uint", dwUnused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
