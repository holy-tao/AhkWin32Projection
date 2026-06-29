#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DESKBANDINFO.ahk" { DESKBANDINFO }
#Import ".\IDockingWindow.ahk" { IDockingWindow }

/**
 * Used to obtain information about a band object.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolewindow">IOleWindow</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> interfaces, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IDeskBand</b> if you are implementing a band object.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * You do not call this interface directly. <b>IDeskBand</b> is used by the Shell or the browser to obtain display information for a band object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskband
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDeskBand extends IDockingWindow {
    /**
     * The interface identifier for IDeskBand
     * @type {Guid}
     */
    static IID := Guid("{eb0fe172-1a3a-11d0-89b3-00a0c90a90ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeskBand interfaces
    */
    struct Vtbl extends IDockingWindow.Vtbl {
        GetBandInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeskBand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets state information for a band object.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The identifier of the band, assigned by the container. The band object can retain this value if it is required.
     * @param {Integer} dwViewMode Type: <b>DWORD</b>
     * @param {Pointer<DESKBANDINFO>} pdbi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-deskbandinfo">DESKBANDINFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-deskbandinfo">DESKBANDINFO</a> structure that receives the band information for the object. The <b>dwMask</b> member of this structure indicates the specific information that is being requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ideskband-getbandinfo
     */
    GetBandInfo(dwBandID, dwViewMode, pdbi) {
        result := ComCall(8, this, "uint", dwBandID, "uint", dwViewMode, DESKBANDINFO.Ptr, pdbi, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDeskBand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBandInfo := CallbackCreate(GetMethod(implObj, "GetBandInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBandInfo)
    }
}
