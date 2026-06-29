#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPresentationSurface.ahk" { IPresentationSurface }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IPresentationBuffer.ahk" { IPresentationBuffer }
#Import ".\IPresentStatistics.ahk" { IPresentStatistics }
#Import ".\PresentStatisticsKind.ahk" { PresentStatisticsKind }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SystemInterruptTime.ahk" { SystemInterruptTime }

/**
 * Defines methods for managing presentation.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationmanager
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentationManager extends IUnknown {
    /**
     * The interface identifier for IPresentationManager
     * @type {Guid}
     */
    static IID := Guid("{fb562f82-6292-470a-88b1-843661e7f20c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddBufferFromResource              : IntPtr
        CreatePresentationSurface          : IntPtr
        GetNextPresentId                   : IntPtr
        SetTargetTime                      : IntPtr
        SetPreferredPresentDuration        : IntPtr
        ForceVSyncInterrupt                : IntPtr
        Present                            : IntPtr
        GetPresentRetiringFence            : IntPtr
        CancelPresentsFrom                 : IntPtr
        GetLostEvent                       : IntPtr
        GetPresentStatisticsAvailableEvent : IntPtr
        EnablePresentStatisticsKind        : IntPtr
        GetNextPresentStatistics           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Creates a presentation surface for a piece of content that can be hosted in a visual tree and assigned a single front buffer.
     * @param {HANDLE} compositionSurfaceHandle Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * 
     * A handle to the composition surface to bind the presentation surface to.
     * @returns {IPresentationSurface} Type: **[IPresentationSurface](nn-presentation-ipresentationsurface.md)**
     * 
     * The created presentation surface.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-createpresentationsurface
     */
    CreatePresentationSurface(compositionSurfaceHandle) {
        result := ComCall(4, this, HANDLE, compositionSurfaceHandle, "ptr*", &presentationSurface := 0, "HRESULT")
        return IPresentationSurface(presentationSurface)
    }

    /**
     * Gets the identifier for the next present. All synchronization fences will be signaled to this value when referring to that present.
     * @returns {Integer} Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The identifier for the next present.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getnextpresentid
     */
    GetNextPresentId() {
        result := ComCall(5, this, Int64)
        return result
    }

    /**
     * Sets a target time for the next present.
     * @remarks
     * The system will attempt to display the present as close to the specified time as possible.
     * 
     * This parameter setting persists across presents.
     * @param {SystemInterruptTime} targetTime Type: **[SystemInterruptTime](../presentationtypes/ns-presentationtypes-systeminterrupttime.md)**
     * 
     * The target time for the next present.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-settargettime
     */
    SetTargetTime(targetTime) {
        result := ComCall(6, this, SystemInterruptTime, targetTime, "HRESULT")
        return result
    }

    /**
     * Sets the preferred frame duration.
     * @remarks
     * Preferred frame duration is meant to be used as a hint to the system that it would be preferred to refresh the output at the specified framerate. Displays that support this rate, or a multiple, will be set into that mode if appropriate.
     * 
     * This parameter setting persists across presents.
     * @param {SystemInterruptTime} preferredDuration Type: **[SystemInterruptTime](../presentationtypes/ns-presentationtypes-systeminterrupttime.md)**
     * 
     * The requested duration, in interrupt time.
     * @param {SystemInterruptTime} deviationTolerance Type: **[SystemInterruptTime](../presentationtypes/ns-presentationtypes-systeminterrupttime.md)**
     * 
     * The allowed tolerance. If the magnitude of the difference between a supported system duration and the _`preferredDuration`_ parameter is within the _`deviationTolerance`_ parameter, that system duration will be used.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-setpreferredpresentduration
     */
    SetPreferredPresentDuration(preferredDuration, deviationTolerance) {
        result := ComCall(7, this, SystemInterruptTime, preferredDuration, SystemInterruptTime, deviationTolerance, "HRESULT")
        return result
    }

    /**
     * Sets a value that indicates whether the GPU should always issue a VSync interrupt when a present is shown.
     * @remarks
     * In order to take advantage of systems with hardware flip queue support, presents can be handled completely by the GPU without CPU involvement. This has power-saving benefits, but also means that buffer available events, the present retiring fence, and present statistics may not update immediately when the present is shown, but instead may update quite a bit later when the GPU periodically updates the CPU regarding what it has done independently.
     * 
     * An application can allow certain presents it doesn't need immediate feedback about to participate in this behavior by explicitly controlling whether the GPU should issue a VSync interrupt when each is shown. If not, such presents will result in improved power efficiency, at the cost of delayed feedback.
     * 
     * By default, presents will always force a VSync interrupt. Applications can opt into allowing some presents to not force a VSync interrupt by calling this method. If a system does not offer hardware flip queue support, all presents will issue a VSync interrupt and update the CPU, regardless of this setting.
     * 
     * This parameter setting persists across presents.
     * @param {Integer} forceVsyncInterrupt Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` to always issue a VSync interrupt; otherwise, `FALSE`.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-forcevsyncinterrupt
     */
    ForceVSyncInterrupt(forceVsyncInterrupt) {
        result := ComCall(8, this, "char", forceVsyncInterrupt, "HRESULT")
        return result
    }

    /**
     * Presents this presentation manager.
     * @remarks
     * If the presentation manager has become lost, this call will return `PRESENTATION_ERROR_LOST`. If the application receives that error, you must destroy this presentation manager and create a new one.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-present
     */
    Present() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Gets a fence that signals when a present is retiring.
     * @remarks
     * This fence will be signaled to the Present ID of each present when that present has begun retiring - that is, a subsequent present has been queued to take its place.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the interface identifier (IID) of the interface being queried for.
     * @returns {Pointer<Void>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the _`riid`_ parameter.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentretiringfence
     */
    GetPresentRetiringFence(riid) {
        result := ComCall(10, this, Guid.Ptr, riid, "ptr*", &fence := 0, "HRESULT")
        return fence
    }

    /**
     * Cancels any previously issued and still in-flight presents that have not yet displayed, and whose Present IDs are at least the passed in _`presentIdToCancelFrom`_.
     * @remarks
     * If any presents in the past have already been displayed, this call will not fail - those presents will simply not be canceled. The present retiring fence will not be signaled for any canceled presents, because when presents are canceled, they don't affect the currently displayed present or cause it to begin the retiring process. For this reason, it is suggested that after performing a present, an application queries buffer available events to find an available buffer to issue on the first present after a cancel. Once that present is queued, it allows the previously displayed present to begin the retiring process, and signal the present retiring fence.
     * @param {Integer} presentIdToCancelFrom Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The identifier of the present from which to cancel presents that have been issued but not yet displayed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-cancelpresentsfrom
     */
    CancelPresentsFrom(presentIdToCancelFrom) {
        result := ComCall(11, this, "uint", presentIdToCancelFrom, "HRESULT")
        return result
    }

    /**
     * Gets a handle to an event that signals when the presentation manager hits an error it cannot recover from.
     * @remarks
     * The returned event will be signaled when the presentation manager hits an error it cannot recover from. In this case, the application should release this presentation manager and create a new one.
     * 
     * An application can wait on and query this event, but it cannot modify its state. The presentation manager controls this event.
     * @returns {HANDLE} Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * 
     * A handle to the event.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getlostevent
     */
    GetLostEvent() {
        lostEventHandle := HANDLE.Owned()
        result := ComCall(12, this, HANDLE.Ptr, lostEventHandle, "HRESULT")
        return lostEventHandle
    }

    /**
     * Gets a handle to an event that signals when present statistics are available to report.
     * @remarks
     * The caller is responsible for closing the returned event.
     * 
     * An application can wait on and query this event, but it cannot modify its state. The presentation manager controls this event.
     * @returns {HANDLE} Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * 
     * A handle to the event.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getpresentstatisticsavailableevent
     */
    GetPresentStatisticsAvailableEvent() {
        presentStatisticsAvailableEventHandle := HANDLE.Owned()
        result := ComCall(13, this, HANDLE.Ptr, presentStatisticsAvailableEventHandle, "HRESULT")
        return presentStatisticsAvailableEventHandle
    }

    /**
     * Enables or disables the specified present statistics kind.
     * @remarks
     * The requested change takes place as soon as possible, however effects can be delayed. We suggest that you register all desired present statistics before you issue presents, and not change during use. This is also how statistics can be extended and changed in the future without breaking backwards compatibility.
     * @param {PresentStatisticsKind} _presentStatisticsKind Type: **[PresentStatisticsKind](../presentationtypes/ne-presentationtypes-presentstatisticskind.md)**
     * 
     * The present statistics kind to enable or disable.
     * @param {Integer} enabled Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` to enable the present statistics kind; otherwise, `FALSE`.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/winprog/windows-data-types)**
     * 
     * If the function succeeds, it returns `S_OK`; otherwise, it returns an `HRESULT` value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-enablepresentstatisticskind
     */
    EnablePresentStatisticsKind(_presentStatisticsKind, enabled) {
        result := ComCall(14, this, PresentStatisticsKind, _presentStatisticsKind, "char", enabled, "HRESULT")
        return result
    }

    /**
     * Gets the next present statistics item in the queue.
     * @remarks
     * If the present statistics queue is empty, no error will be returned. Instead, `nullptr` will be returned in the out parameter.
     * @returns {IPresentStatistics} Type: **[IPresentStatistics](nn-presentation-ipresentstatistics.md) \*\***
     * 
     * A pointer to the next present statistics item in the queue , or `nullptr` if the queue is empty.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationmanager-getnextpresentstatistics
     */
    GetNextPresentStatistics() {
        result := ComCall(15, this, "ptr*", &nextPresentStatistics := 0, "HRESULT")
        return IPresentStatistics(nextPresentStatistics)
    }

    Query(iid) {
        if (IPresentationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddBufferFromResource := CallbackCreate(GetMethod(implObj, "AddBufferFromResource"), flags, 3)
        this.vtbl.CreatePresentationSurface := CallbackCreate(GetMethod(implObj, "CreatePresentationSurface"), flags, 3)
        this.vtbl.GetNextPresentId := CallbackCreate(GetMethod(implObj, "GetNextPresentId"), flags, 1)
        this.vtbl.SetTargetTime := CallbackCreate(GetMethod(implObj, "SetTargetTime"), flags, 2)
        this.vtbl.SetPreferredPresentDuration := CallbackCreate(GetMethod(implObj, "SetPreferredPresentDuration"), flags, 3)
        this.vtbl.ForceVSyncInterrupt := CallbackCreate(GetMethod(implObj, "ForceVSyncInterrupt"), flags, 2)
        this.vtbl.Present := CallbackCreate(GetMethod(implObj, "Present"), flags, 1)
        this.vtbl.GetPresentRetiringFence := CallbackCreate(GetMethod(implObj, "GetPresentRetiringFence"), flags, 3)
        this.vtbl.CancelPresentsFrom := CallbackCreate(GetMethod(implObj, "CancelPresentsFrom"), flags, 2)
        this.vtbl.GetLostEvent := CallbackCreate(GetMethod(implObj, "GetLostEvent"), flags, 2)
        this.vtbl.GetPresentStatisticsAvailableEvent := CallbackCreate(GetMethod(implObj, "GetPresentStatisticsAvailableEvent"), flags, 2)
        this.vtbl.EnablePresentStatisticsKind := CallbackCreate(GetMethod(implObj, "EnablePresentStatisticsKind"), flags, 3)
        this.vtbl.GetNextPresentStatistics := CallbackCreate(GetMethod(implObj, "GetNextPresentStatistics"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddBufferFromResource)
        CallbackFree(this.vtbl.CreatePresentationSurface)
        CallbackFree(this.vtbl.GetNextPresentId)
        CallbackFree(this.vtbl.SetTargetTime)
        CallbackFree(this.vtbl.SetPreferredPresentDuration)
        CallbackFree(this.vtbl.ForceVSyncInterrupt)
        CallbackFree(this.vtbl.Present)
        CallbackFree(this.vtbl.GetPresentRetiringFence)
        CallbackFree(this.vtbl.CancelPresentsFrom)
        CallbackFree(this.vtbl.GetLostEvent)
        CallbackFree(this.vtbl.GetPresentStatisticsAvailableEvent)
        CallbackFree(this.vtbl.EnablePresentStatisticsKind)
        CallbackFree(this.vtbl.GetNextPresentStatistics)
    }
}
