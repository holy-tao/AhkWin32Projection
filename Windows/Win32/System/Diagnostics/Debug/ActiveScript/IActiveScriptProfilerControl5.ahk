#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerControl4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl5 extends IActiveScriptProfilerControl4{

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
     * @param {Integer} enumFlags 
     * @param {Pointer<IActiveScriptProfilerHeapEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumHeap2(enumFlags, ppEnum) {
        result := ComCall(10, this, "int", enumFlags, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
