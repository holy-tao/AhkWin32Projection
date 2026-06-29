#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\PROFILER_HEAP_ENUM_FLAGS.ahk
#Include .\IActiveScriptProfilerControl4.ahk
#Include .\IActiveScriptProfilerHeapEnum.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IActiveScriptProfilerControl5 extends IActiveScriptProfilerControl4 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerControl5
     * @type {Guid}
     */
    static IID => Guid("{1c01a2d1-8f0f-46a5-9720-0d7ed2c62f0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumHeap2"]

    /**
     * 
     * @param {PROFILER_HEAP_ENUM_FLAGS} enumFlags 
     * @returns {IActiveScriptProfilerHeapEnum} 
     */
    EnumHeap2(enumFlags) {
        result := ComCall(10, this, "int", enumFlags, "ptr*", &ppEnum := 0, "HRESULT")
        return IActiveScriptProfilerHeapEnum(ppEnum)
    }
}
