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
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @param {Integer} stid 
     * @param {Pointer<Integer>} pluHi 
     * @param {Pointer<Integer>} pluLo 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetStat(stid, pluHi, pluLo) {
        pluHiMarshal := pluHi is VarRef ? "uint*" : "ptr"
        pluLoMarshal := pluLo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", stid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(4, this, "ptr", guid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetStats() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
