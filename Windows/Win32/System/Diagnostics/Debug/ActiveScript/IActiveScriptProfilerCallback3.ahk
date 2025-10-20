#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerCallback2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerCallback3 extends IActiveScriptProfilerCallback2{
    /**
     * The interface identifier for IActiveScriptProfilerCallback3
     * @type {Guid}
     */
    static IID => Guid("{6ac5ad25-2037-4687-91df-b59979d93d73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Integer} webWorkerId 
     * @returns {HRESULT} 
     */
    SetWebWorkerId(webWorkerId) {
        result := ComCall(11, this, "uint", webWorkerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
