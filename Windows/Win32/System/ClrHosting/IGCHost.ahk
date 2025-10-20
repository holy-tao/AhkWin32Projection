#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IGCHost extends IUnknown{
    /**
     * The interface identifier for IGCHost
     * @type {Guid}
     */
    static IID => Guid("{fac34f6e-0dcd-47b5-8021-531bc5ecca63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} SegmentSize 
     * @param {Integer} MaxGen0Size 
     * @returns {HRESULT} 
     */
    SetGCStartupLimits(SegmentSize, MaxGen0Size) {
        result := ComCall(3, this, "uint", SegmentSize, "uint", MaxGen0Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    Collect(Generation) {
        result := ComCall(4, this, "int", Generation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COR_GC_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetStats(pStats) {
        result := ComCall(5, this, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFiberCookie 
     * @param {Pointer<COR_GC_THREAD_STATS>} pStats 
     * @returns {HRESULT} 
     */
    GetThreadStats(pFiberCookie, pStats) {
        result := ComCall(6, this, "uint*", pFiberCookie, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} sztMaxVirtualMemMB 
     * @returns {HRESULT} 
     */
    SetVirtualMemLimit(sztMaxVirtualMemMB) {
        result := ComCall(7, this, "ptr", sztMaxVirtualMemMB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
