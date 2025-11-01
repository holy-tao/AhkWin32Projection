#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugStack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptDebugStack
     * @type {Guid}
     */
    static IID => Guid("{051364dd-e449-443e-9762-fe578f4a5473}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameCount", "GetStackFrame"]

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} frameNumber 
     * @param {Pointer<IDataModelScriptDebugStackFrame>} stackFrame 
     * @returns {HRESULT} 
     */
    GetStackFrame(frameNumber, stackFrame) {
        result := ComCall(4, this, "uint", frameNumber, "ptr*", stackFrame, "HRESULT")
        return result
    }
}
