#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptStats extends IUnknown{
    /**
     * The interface identifier for IActiveScriptStats
     * @type {Guid}
     */
    static IID => Guid("{b8da6310-e19b-11d0-933c-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} stid 
     * @param {Pointer<UInt32>} pluHi 
     * @param {Pointer<UInt32>} pluLo 
     * @returns {HRESULT} 
     */
    GetStat(stid, pluHi, pluLo) {
        result := ComCall(3, this, "uint", stid, "uint*", pluHi, "uint*", pluLo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<UInt32>} pluHi 
     * @param {Pointer<UInt32>} pluLo 
     * @returns {HRESULT} 
     */
    GetStatEx(guid, pluHi, pluLo) {
        result := ComCall(4, this, "ptr", guid, "uint*", pluHi, "uint*", pluLo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetStats() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
