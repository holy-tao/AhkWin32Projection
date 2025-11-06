#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IJsDebugStackWalker.ahk
#Include .\IJsDebugBreakPoint.ahk
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
     * @returns {IJsDebugStackWalker} 
     */
    CreateStackWalker(threadId) {
        result := ComCall(3, this, "uint", threadId, "ptr*", &ppStackWalker := 0, "HRESULT")
        return IJsDebugStackWalker(ppStackWalker)
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Integer} characterOffset 
     * @param {Integer} characterCount 
     * @param {BOOL} isEnabled 
     * @returns {IJsDebugBreakPoint} 
     */
    CreateBreakPoint(documentId, characterOffset, characterCount, isEnabled) {
        result := ComCall(4, this, "uint", documentId, "uint", characterOffset, "uint", characterCount, "int", isEnabled, "ptr*", &ppDebugBreakPoint := 0, "HRESULT")
        return IJsDebugBreakPoint(ppDebugBreakPoint)
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
     * @returns {Integer} 
     */
    GetExternalStepAddress() {
        result := ComCall(6, this, "uint*", &pCodeAddress := 0, "HRESULT")
        return pCodeAddress
    }
}
