#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPresentStatistics.ahk" { IPresentStatistics }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\SystemInterruptTime.ahk" { SystemInterruptTime }

/**
 * Describes how the system displayed an instance of a particular piece of content within a particular independent-flip present.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-iindependentflipframepresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IIndependentFlipFramePresentStatistics extends IPresentStatistics {
    /**
     * The interface identifier for IIndependentFlipFramePresentStatistics
     * @type {Guid}
     */
    static IID := Guid("{8c93be27-ad94-4da0-8fd4-2413132d124e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIndependentFlipFramePresentStatistics interfaces
    */
    struct Vtbl extends IPresentStatistics.Vtbl {
        GetOutputAdapterLUID   : IntPtr
        GetOutputVidPnSourceId : IntPtr
        GetContentTag          : IntPtr
        GetDisplayedTime       : IntPtr
        GetPresentDuration     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIndependentFlipFramePresentStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the locally unique ID (LUID) that refers to the display adapter on which this independent-flip present occurred.
     * @returns {LUID} Type: **[LUID](/windows/win32/api/winnt/ns-winnt-luid)**
     * 
     * A locally unique ID (LUID) that refers to the display adapter on which this independent-flip present occurred.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputadapterluid
     */
    GetOutputAdapterLUID() {
        result := ComCall(5, this, LUID)
        return result
    }

    /**
     * Gets an integer that identifies a video present source on the display adapter.
     * @returns {Integer} Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An integer that identifies a video present source on the display adapter.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getoutputvidpnsourceid
     */
    GetOutputVidPnSourceId() {
        result := ComCall(6, this, UInt32)
        return result
    }

    /**
     * Gets the tag of the content on which statistics are being reporting. (IIndependentFlipFramePresentStatistics::GetContentTag)
     * @returns {Pointer} Type: **[UINT_PTR_](/windows/desktop/winprog/windows-data-types)**
     * 
     * The tag of the content on which statistics are being reporting.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getcontenttag
     */
    GetContentTag() {
        result := ComCall(7, this, IntPtr)
        return result
    }

    /**
     * Gets the time the present was displayed.
     * @returns {SystemInterruptTime} TYPE: **[SystemInterruptTime](/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime)**
     * 
     * The time the present was displayed.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getdisplayedtime
     */
    GetDisplayedTime() {
        result := ComCall(8, this, SystemInterruptTime)
        return result
    }

    /**
     * Gets the actual amount of time the present was displayed.
     * @remarks
     * The actual present duration may be different from the preferred present duration requested by the application if the system decided not to honor the preferred duration. This usually happens either because it was not supported by the driver, or other content on screen influenced the system to go with another duration.
     * @returns {SystemInterruptTime} TYPE: **[SystemInterruptTime](/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime)**
     * 
     * The actual amount of time the present was displayed.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-iindependentflipframepresentstatistics-getpresentduration
     */
    GetPresentDuration() {
        result := ComCall(9, this, SystemInterruptTime)
        return result
    }

    Query(iid) {
        if (IIndependentFlipFramePresentStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutputAdapterLUID := CallbackCreate(GetMethod(implObj, "GetOutputAdapterLUID"), flags, 1)
        this.vtbl.GetOutputVidPnSourceId := CallbackCreate(GetMethod(implObj, "GetOutputVidPnSourceId"), flags, 1)
        this.vtbl.GetContentTag := CallbackCreate(GetMethod(implObj, "GetContentTag"), flags, 1)
        this.vtbl.GetDisplayedTime := CallbackCreate(GetMethod(implObj, "GetDisplayedTime"), flags, 1)
        this.vtbl.GetPresentDuration := CallbackCreate(GetMethod(implObj, "GetPresentDuration"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutputAdapterLUID)
        CallbackFree(this.vtbl.GetOutputVidPnSourceId)
        CallbackFree(this.vtbl.GetContentTag)
        CallbackFree(this.vtbl.GetDisplayedTime)
        CallbackFree(this.vtbl.GetPresentDuration)
    }
}
