#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRGCManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRGCManager
     * @type {Guid}
     */
    static IID => Guid("{54d9007e-a8e2-4885-b7bf-f998deee4f2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Collect", "GetStats", "SetGCStartupLimits"]

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    Collect(Generation) {
        result := ComCall(3, this, "int", Generation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COR_GC_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetStats(pStats) {
        result := ComCall(4, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SegmentSize 
     * @param {Integer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimits(SegmentSize, MaxGen0Size) {
        result := ComCall(5, this, "uint", SegmentSize, "uint", MaxGen0Size, "HRESULT")
        return result
    }
}
