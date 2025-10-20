#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplicationThread extends IUnknown{
    /**
     * The interface identifier for IRemoteDebugApplicationThread
     * @type {Guid}
     */
    static IID => Guid("{51973c37-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} dwThreadId 
     * @returns {HRESULT} 
     */
    GetSystemThreadId(dwThreadId) {
        result := ComCall(3, this, "uint*", dwThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDebugApplication>} pprda 
     * @returns {HRESULT} 
     */
    GetApplication(pprda) {
        result := ComCall(4, this, "ptr", pprda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDebugStackFrames>} ppedsf 
     * @returns {HRESULT} 
     */
    EnumStackFrames(ppedsf) {
        result := ComCall(5, this, "ptr", ppedsf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     */
    GetDescription(pbstrDescription, pbstrState) {
        result := ComCall(6, this, "ptr", pbstrDescription, "ptr", pbstrState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugStackFrame>} pStackFrame 
     * @param {Pointer<IDebugCodeContext>} pCodeContext 
     * @returns {HRESULT} 
     */
    SetNextStatement(pStackFrame, pCodeContext) {
        result := ComCall(7, this, "ptr", pStackFrame, "ptr", pCodeContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pState 
     * @returns {HRESULT} 
     */
    GetState(pState) {
        result := ComCall(8, this, "uint*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    Suspend(pdwCount) {
        result := ComCall(9, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    Resume(pdwCount) {
        result := ComCall(10, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetSuspendCount(pdwCount) {
        result := ComCall(11, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
