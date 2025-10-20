#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IEnumRemoteDebugApplicationThreads extends IUnknown{
    /**
     * The interface identifier for IEnumRemoteDebugApplicationThreads
     * @type {Guid}
     */
    static IID => Guid("{51973c3c-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IRemoteDebugApplicationThread>} pprdat 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, pprdat, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", pprdat, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRemoteDebugApplicationThreads>} pperdat 
     * @returns {HRESULT} 
     */
    Clone(pperdat) {
        result := ComCall(6, this, "ptr", pperdat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
