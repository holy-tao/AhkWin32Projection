#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationmanager
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddBufferFromResource", "CreatePresentationSurface", "GetNextPresentId", "SetTargetTime", "SetPreferredPresentDuration", "ForceVSyncInterrupt", "Present", "GetPresentRetiringFence", "CancelPresentsFrom", "GetLostEvent", "GetPresentStatisticsAvailableEvent", "EnablePresentStatisticsKind", "GetNextPresentStatistics"]

    /**
     * 
     * @param {IUnknown} resource 
     * @param {Pointer<IPresentationBuffer>} presentationBuffer 
     * @returns {HRESULT} 
     */
    AddBufferFromResource(resource, presentationBuffer) {
        result := ComCall(3, this, "ptr", resource, "ptr*", presentationBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} compositionSurfaceHandle 
     * @param {Pointer<IPresentationSurface>} presentationSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-createpresentationsurface
     */
    CreatePresentationSurface(compositionSurfaceHandle, presentationSurface) {
        compositionSurfaceHandle := compositionSurfaceHandle is Win32Handle ? NumGet(compositionSurfaceHandle, "ptr") : compositionSurfaceHandle

        result := ComCall(4, this, "ptr", compositionSurfaceHandle, "ptr*", presentationSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getnextpresentid
     */
    GetNextPresentId() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * 
     * @param {SystemInterruptTime} targetTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-settargettime
     */
    SetTargetTime(targetTime) {
        result := ComCall(6, this, "ptr", targetTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SystemInterruptTime} preferredDuration 
     * @param {SystemInterruptTime} deviationTolerance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-setpreferredpresentduration
     */
    SetPreferredPresentDuration(preferredDuration, deviationTolerance) {
        result := ComCall(7, this, "ptr", preferredDuration, "ptr", deviationTolerance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} forceVsyncInterrupt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-forcevsyncinterrupt
     */
    ForceVSyncInterrupt(forceVsyncInterrupt) {
        result := ComCall(8, this, "char", forceVsyncInterrupt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-present
     */
    Present() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} fence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentretiringfence
     */
    GetPresentRetiringFence(riid, fence) {
        result := ComCall(10, this, "ptr", riid, "ptr*", fence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} presentIdToCancelFrom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-cancelpresentsfrom
     */
    CancelPresentsFrom(presentIdToCancelFrom) {
        result := ComCall(11, this, "uint", presentIdToCancelFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} lostEventHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getlostevent
     */
    GetLostEvent(lostEventHandle) {
        result := ComCall(12, this, "ptr", lostEventHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} presentStatisticsAvailableEventHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentstatisticsavailableevent
     */
    GetPresentStatisticsAvailableEvent(presentStatisticsAvailableEventHandle) {
        result := ComCall(13, this, "ptr", presentStatisticsAvailableEventHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} presentStatisticsKind 
     * @param {Integer} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-enablepresentstatisticskind
     */
    EnablePresentStatisticsKind(presentStatisticsKind, enabled) {
        result := ComCall(14, this, "int", presentStatisticsKind, "char", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPresentStatistics>} nextPresentStatistics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getnextpresentstatistics
     */
    GetNextPresentStatistics(nextPresentStatistics) {
        result := ComCall(15, this, "ptr*", nextPresentStatistics, "HRESULT")
        return result
    }
}
