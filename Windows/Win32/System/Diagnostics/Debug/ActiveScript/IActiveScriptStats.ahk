#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptStats extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStat", "GetStatEx", "ResetStats"]

    /**
     * 
     * @param {Integer} stid 
     * @param {Pointer<Integer>} pluHi 
     * @param {Pointer<Integer>} pluLo 
     * @returns {HRESULT} 
     */
    GetStat(stid, pluHi, pluLo) {
        pluHiMarshal := pluHi is VarRef ? "uint*" : "ptr"
        pluLoMarshal := pluLo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", stid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} pluHi 
     * @param {Pointer<Integer>} pluLo 
     * @returns {HRESULT} 
     */
    GetStatEx(guid, pluHi, pluLo) {
        pluHiMarshal := pluHi is VarRef ? "uint*" : "ptr"
        pluLoMarshal := pluLo is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", guid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetStats() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
