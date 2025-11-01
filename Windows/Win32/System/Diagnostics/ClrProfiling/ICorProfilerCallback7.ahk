#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback6.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback7 extends ICorProfilerCallback6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback7
     * @type {Guid}
     */
    static IID => Guid("{f76a2dba-1d52-4539-866c-2aa518f9efc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 91

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ModuleInMemorySymbolsUpdated"]

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleInMemorySymbolsUpdated(moduleId) {
        result := ComCall(91, this, "ptr", moduleId, "HRESULT")
        return result
    }
}
