#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationManager extends IUnknown{
    /**
     * The interface identifier for IPresentationManager
     * @type {Guid}
     */
    static IID => Guid("{fb562f82-6292-470a-88b1-843661e7f20c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} resource 
     * @param {Pointer<IPresentationBuffer>} presentationBuffer 
     * @returns {HRESULT} 
     */
    AddBufferFromResource(resource, presentationBuffer) {
        result := ComCall(3, this, "ptr", resource, "ptr", presentationBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} compositionSurfaceHandle 
     * @param {Pointer<IPresentationSurface>} presentationSurface 
     * @returns {HRESULT} 
     */
    CreatePresentationSurface(compositionSurfaceHandle, presentationSurface) {
        compositionSurfaceHandle := compositionSurfaceHandle is Win32Handle ? NumGet(compositionSurfaceHandle, "ptr") : compositionSurfaceHandle

        result := ComCall(4, this, "ptr", compositionSurfaceHandle, "ptr", presentationSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNextPresentId() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {SystemInterruptTime} targetTime 
     * @returns {HRESULT} 
     */
    SetTargetTime(targetTime) {
        result := ComCall(6, this, "ptr", targetTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SystemInterruptTime} preferredDuration 
     * @param {SystemInterruptTime} deviationTolerance 
     * @returns {HRESULT} 
     */
    SetPreferredPresentDuration(preferredDuration, deviationTolerance) {
        result := ComCall(7, this, "ptr", preferredDuration, "ptr", deviationTolerance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} forceVsyncInterrupt 
     * @returns {HRESULT} 
     */
    ForceVSyncInterrupt(forceVsyncInterrupt) {
        result := ComCall(8, this, "char", forceVsyncInterrupt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Present() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} fence 
     * @returns {HRESULT} 
     */
    GetPresentRetiringFence(riid, fence) {
        result := ComCall(10, this, "ptr", riid, "ptr", fence, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} presentIdToCancelFrom 
     * @returns {HRESULT} 
     */
    CancelPresentsFrom(presentIdToCancelFrom) {
        result := ComCall(11, this, "uint", presentIdToCancelFrom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} lostEventHandle 
     * @returns {HRESULT} 
     */
    GetLostEvent(lostEventHandle) {
        result := ComCall(12, this, "ptr", lostEventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} presentStatisticsAvailableEventHandle 
     * @returns {HRESULT} 
     */
    GetPresentStatisticsAvailableEvent(presentStatisticsAvailableEventHandle) {
        result := ComCall(13, this, "ptr", presentStatisticsAvailableEventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} presentStatisticsKind 
     * @param {Integer} enabled 
     * @returns {HRESULT} 
     */
    EnablePresentStatisticsKind(presentStatisticsKind, enabled) {
        result := ComCall(14, this, "int", presentStatisticsKind, "char", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPresentStatistics>} nextPresentStatistics 
     * @returns {HRESULT} 
     */
    GetNextPresentStatistics(nextPresentStatistics) {
        result := ComCall(15, this, "ptr", nextPresentStatistics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
