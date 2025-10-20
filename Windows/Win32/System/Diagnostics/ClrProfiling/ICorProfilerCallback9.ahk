#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback8.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback9 extends ICorProfilerCallback8{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback9
     * @type {Guid}
     */
    static IID => Guid("{27583ec3-c8f5-482f-8052-194b8ce4705a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 94

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DynamicMethodUnloaded"]

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    DynamicMethodUnloaded(functionId) {
        result := ComCall(94, this, "ptr", functionId, "HRESULT")
        return result
    }
}
