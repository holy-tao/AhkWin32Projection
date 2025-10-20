#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugProcess extends IUnknown{
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
     * 
     * @param {Integer} threadId 
     * @param {Pointer<IJsDebugStackWalker>} ppStackWalker 
     * @returns {HRESULT} 
     */
    CreateStackWalker(threadId, ppStackWalker) {
        result := ComCall(3, this, "uint", threadId, "ptr", ppStackWalker, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "uint", documentId, "uint", characterOffset, "uint", characterCount, "int", isEnabled, "ptr", ppDebugBreakPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    PerformAsyncBreak(threadId) {
        result := ComCall(5, this, "uint", threadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pCodeAddress 
     * @returns {HRESULT} 
     */
    GetExternalStepAddress(pCodeAddress) {
        result := ComCall(6, this, "uint*", pCodeAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
