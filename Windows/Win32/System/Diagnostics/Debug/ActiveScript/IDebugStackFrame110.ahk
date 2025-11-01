#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugStackFrame.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrame110 extends IDebugStackFrame{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugStackFrame110
     * @type {Guid}
     */
    static IID => Guid("{4b509611-b6ea-4b24-adcb-d0ccfd1a7e33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStackFrameType", "GetScriptInvocationContext"]

    /**
     * 
     * @param {Pointer<Integer>} pStackFrameKind 
     * @returns {HRESULT} 
     */
    GetStackFrameType(pStackFrameKind) {
        result := ComCall(8, this, "int*", pStackFrameKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IScriptInvocationContext>} ppInvocationContext 
     * @returns {HRESULT} 
     */
    GetScriptInvocationContext(ppInvocationContext) {
        result := ComCall(9, this, "ptr*", ppInvocationContext, "HRESULT")
        return result
    }
}
