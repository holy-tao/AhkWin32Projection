#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPresentationBuffer.ahk
#Include .\IPresentationSurface.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IPresentStatistics.ahk
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
     * @returns {IPresentationBuffer} 
     */
    AddBufferFromResource(resource) {
        result := ComCall(3, this, "ptr", resource, "ptr*", &presentationBuffer := 0, "HRESULT")
        return IPresentationBuffer(presentationBuffer)
    }

    /**
     * 
     * @param {HANDLE} compositionSurfaceHandle 
     * @returns {IPresentationSurface} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-createpresentationsurface
     */
    CreatePresentationSurface(compositionSurfaceHandle) {
        compositionSurfaceHandle := compositionSurfaceHandle is Win32Handle ? NumGet(compositionSurfaceHandle, "ptr") : compositionSurfaceHandle

        result := ComCall(4, this, "ptr", compositionSurfaceHandle, "ptr*", &presentationSurface := 0, "HRESULT")
        return IPresentationSurface(presentationSurface)
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentretiringfence
     */
    GetPresentRetiringFence(riid) {
        result := ComCall(10, this, "ptr", riid, "ptr*", &fence := 0, "HRESULT")
        return fence
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
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getlostevent
     */
    GetLostEvent() {
        lostEventHandle := HANDLE()
        result := ComCall(12, this, "ptr", lostEventHandle, "HRESULT")
        return lostEventHandle
    }

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentstatisticsavailableevent
     */
    GetPresentStatisticsAvailableEvent() {
        presentStatisticsAvailableEventHandle := HANDLE()
        result := ComCall(13, this, "ptr", presentStatisticsAvailableEventHandle, "HRESULT")
        return presentStatisticsAvailableEventHandle
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
     * @returns {IPresentStatistics} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getnextpresentstatistics
     */
    GetNextPresentStatistics() {
        result := ComCall(15, this, "ptr*", &nextPresentStatistics := 0, "HRESULT")
        return IPresentStatistics(nextPresentStatistics)
    }
}
