#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PresentStatisticsKind.ahk" { PresentStatisticsKind }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a single entry in the present statistics queue.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentstatistics
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentStatistics extends IUnknown {
    /**
     * The interface identifier for IPresentStatistics
     * @type {Guid}
     */
    static IID := Guid("{b44b8bda-7282-495d-9dd7-ceadd8b4bb86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentStatistics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPresentId : IntPtr
        GetKind      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identifier of the present to which this statistic corresponds.
     * @returns {Integer} Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The identifier of the present to which this statistic corresponds.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentstatistics-getpresentid
     */
    GetPresentId() {
        result := ComCall(3, this, Int64)
        return result
    }

    /**
     * Gets the specific kind of present statistics to which this data corresponds.
     * @returns {PresentStatisticsKind} Type: **[PresentStatisticsKind](../presentationtypes/ne-presentationtypes-presentstatisticskind.md)**
     * 
     * The specific kind of present statistics to which this data corresponds.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentstatistics-getkind
     */
    GetKind() {
        result := ComCall(4, this, PresentStatisticsKind)
        return result
    }

    Query(iid) {
        if (IPresentStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPresentId := CallbackCreate(GetMethod(implObj, "GetPresentId"), flags, 1)
        this.vtbl.GetKind := CallbackCreate(GetMethod(implObj, "GetKind"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPresentId)
        CallbackFree(this.vtbl.GetKind)
    }
}
