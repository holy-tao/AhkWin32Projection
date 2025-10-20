#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback3 extends ICorProfilerCallback2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback3
     * @type {Guid}
     */
    static IID => Guid("{4fd2ed52-7731-4b8d-9469-03d2cc3086c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 80

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeForAttach", "ProfilerAttachComplete", "ProfilerDetachSucceeded"]

    /**
     * 
     * @param {IUnknown} pCorProfilerInfoUnk 
     * @param {Pointer<Void>} pvClientData 
     * @param {Integer} cbClientData 
     * @returns {HRESULT} 
     */
    InitializeForAttach(pCorProfilerInfoUnk, pvClientData, cbClientData) {
        result := ComCall(80, this, "ptr", pCorProfilerInfoUnk, "ptr", pvClientData, "uint", cbClientData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ProfilerAttachComplete() {
        result := ComCall(81, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ProfilerDetachSucceeded() {
        result := ComCall(82, this, "HRESULT")
        return result
    }
}
