#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback7.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback8 extends ICorProfilerCallback7{
    /**
     * The interface identifier for ICorProfilerCallback8
     * @type {Guid}
     */
    static IID => Guid("{5bed9b15-c079-4d47-bfe2-215a140c07e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 92

    /**
     * 
     * @param {Pointer} functionId 
     * @param {BOOL} fIsSafeToBlock 
     * @param {Pointer<Byte>} pILHeader 
     * @param {Integer} cbILHeader 
     * @returns {HRESULT} 
     */
    DynamicMethodJITCompilationStarted(functionId, fIsSafeToBlock, pILHeader, cbILHeader) {
        result := ComCall(92, this, "ptr", functionId, "int", fIsSafeToBlock, "char*", pILHeader, "uint", cbILHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {HRESULT} hrStatus 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    DynamicMethodJITCompilationFinished(functionId, hrStatus, fIsSafeToBlock) {
        result := ComCall(93, this, "ptr", functionId, "int", hrStatus, "int", fIsSafeToBlock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
