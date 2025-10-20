#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerControl3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl4 extends IActiveScriptProfilerControl3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerControl4
     * @type {Guid}
     */
    static IID => Guid("{160f94fd-9dbc-40d4-9eac-2b71db3132f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SummarizeHeap"]

    /**
     * 
     * @param {Pointer<PROFILER_HEAP_SUMMARY>} heapSummary 
     * @returns {HRESULT} 
     */
    SummarizeHeap(heapSummary) {
        result := ComCall(9, this, "ptr", heapSummary, "HRESULT")
        return result
    }
}
