#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugProcess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebugProcess
     * @type {Guid}
     */
    static IID => Guid("{3d587168-6a2d-4041-bd3b-0de674502862}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStackWalker", "CreateBreakPoint", "PerformAsyncBreak", "GetExternalStepAddress"]

    /**
     * 
     * @param {Integer} threadId 
     * @param {Pointer<IJsDebugStackWalker>} ppStackWalker 
     * @returns {HRESULT} 
     */
    CreateStackWalker(threadId, ppStackWalker) {
        result := ComCall(3, this, "uint", threadId, "ptr*", ppStackWalker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Integer} characterOffset 
     * @param {Integer} characterCount 
     * @param {BOOL} isEnabled 
     * @param {Pointer<IJsDebugBreakPoint>} ppDebugBreakPoint 
     * @returns {HRESULT} 
     */
    CreateBreakPoint(documentId, characterOffset, characterCount, isEnabled, ppDebugBreakPoint) {
        result := ComCall(4, this, "uint", documentId, "uint", characterOffset, "uint", characterCount, "int", isEnabled, "ptr*", ppDebugBreakPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    PerformAsyncBreak(threadId) {
        result := ComCall(5, this, "uint", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCodeAddress 
     * @returns {HRESULT} 
     */
    GetExternalStepAddress(pCodeAddress) {
        pCodeAddressMarshal := pCodeAddress is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pCodeAddressMarshal, pCodeAddress, "HRESULT")
        return result
    }
}
