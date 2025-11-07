#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptProfilerHeapEnum.ahk
#Include .\IActiveScriptProfilerControl2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptProfilerControl3 extends IActiveScriptProfilerControl2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProfilerControl3
     * @type {Guid}
     */
    static IID => Guid("{0b403015-f381-4023-a5d0-6fed076de716}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumHeap"]

    /**
     * 
     * @returns {IActiveScriptProfilerHeapEnum} 
     */
    EnumHeap() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IActiveScriptProfilerHeapEnum(ppEnum)
    }
}
