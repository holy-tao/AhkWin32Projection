#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPlayerTimestampHook interface is implemented on a player's source filter.
 * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nn-wmdxva-iwmplayertimestamphook
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMPlayerTimestampHook extends IUnknown {
    /**
     * The interface identifier for IWMPlayerTimestampHook
     * @type {Guid}
     */
    static IID := Guid("{28580dda-d98e-48d0-b7ae-69e473a02825}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPlayerTimestampHook interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MapTimestamp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPlayerTimestampHook.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The MapTimestamp method is called by the WMV Decoder DMO to enable the source filter to provide the decoder with a time stamp. The decoder applies the time stamp to the sample before delivering the sample to the video renderer.
     * @param {Integer} rtIn Time stamp previously applied by the DMO.
     * @returns {Integer} Time stamp to be applied to the sample.
     * @see https://learn.microsoft.com/windows/win32/api/wmdxva/nf-wmdxva-iwmplayertimestamphook-maptimestamp
     */
    MapTimestamp(rtIn) {
        result := ComCall(3, this, "int64", rtIn, "int64*", &prtOut := 0, "HRESULT")
        return prtOut
    }

    Query(iid) {
        if (IWMPlayerTimestampHook.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapTimestamp := CallbackCreate(GetMethod(implObj, "MapTimestamp"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapTimestamp)
    }
}
