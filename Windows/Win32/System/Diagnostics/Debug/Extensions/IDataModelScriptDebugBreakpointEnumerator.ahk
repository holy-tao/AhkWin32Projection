#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugBreakpointEnumerator extends IUnknown{
    /**
     * The interface identifier for IDataModelScriptDebugBreakpointEnumerator
     * @type {Guid}
     */
    static IID => Guid("{39484a75-b4f3-4799-86da-691afa57b299}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptDebugBreakpoint>} breakpoint 
     * @returns {HRESULT} 
     */
    GetNext(breakpoint) {
        result := ComCall(4, this, "ptr", breakpoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
