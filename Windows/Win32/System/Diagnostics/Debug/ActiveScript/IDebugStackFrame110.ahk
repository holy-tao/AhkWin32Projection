#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IScriptInvocationContext.ahk
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
     * @returns {Integer} 
     */
    GetStackFrameType() {
        result := ComCall(8, this, "int*", &pStackFrameKind := 0, "HRESULT")
        return pStackFrameKind
    }

    /**
     * 
     * @returns {IScriptInvocationContext} 
     */
    GetScriptInvocationContext() {
        result := ComCall(9, this, "ptr*", &ppInvocationContext := 0, "HRESULT")
        return IScriptInvocationContext(ppInvocationContext)
    }
}
