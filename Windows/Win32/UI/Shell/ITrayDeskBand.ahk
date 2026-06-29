#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that show, hide, and query deskbands.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-itraydeskband
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITrayDeskBand extends IUnknown {
    /**
     * The interface identifier for ITrayDeskBand
     * @type {Guid}
     */
    static IID := Guid("{6d67e846-5b9c-4db8-9cbc-dde12f4254f1}")

    /**
     * The class identifier for TrayDeskBand
     * @type {Guid}
     */
    static CLSID := Guid("{e6442437-6c68-4f52-94dd-2cfed267efb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrayDeskBand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowDeskBand                : IntPtr
        HideDeskBand                : IntPtr
        IsDeskBandShown             : IntPtr
        DeskBandRegistrationChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrayDeskBand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Shows a specified deskband.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * A reference to a deskband CLSID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-showdeskband
     */
    ShowDeskBand(clsid) {
        result := ComCall(3, this, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Hides a specified deskband.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * A reference to a deskband CLSID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-hidedeskband
     */
    HideDeskBand(clsid) {
        result := ComCall(4, this, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Indicates whether a deskband is shown.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * A reference to a deskband CLSID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the deskband is shown, S_FALSE if the deskband is not shown, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-isdeskbandshown
     */
    IsDeskBandShown(clsid) {
        result := ComCall(5, this, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Refreshes the deskband registration cache.
     * @remarks
     * Call this method immediately after making a change to the deskband registration. For example, through the CLSID_StdComponentCategoriesMgr object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-deskbandregistrationchanged
     */
    DeskBandRegistrationChanged() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITrayDeskBand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowDeskBand := CallbackCreate(GetMethod(implObj, "ShowDeskBand"), flags, 2)
        this.vtbl.HideDeskBand := CallbackCreate(GetMethod(implObj, "HideDeskBand"), flags, 2)
        this.vtbl.IsDeskBandShown := CallbackCreate(GetMethod(implObj, "IsDeskBandShown"), flags, 2)
        this.vtbl.DeskBandRegistrationChanged := CallbackCreate(GetMethod(implObj, "DeskBandRegistrationChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowDeskBand)
        CallbackFree(this.vtbl.HideDeskBand)
        CallbackFree(this.vtbl.IsDeskBandShown)
        CallbackFree(this.vtbl.DeskBandRegistrationChanged)
    }
}
