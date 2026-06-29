#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDeskBand.ahk" { IDeskBand }
#Import ".\BANDSITEINFO.ahk" { BANDSITEINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that control band objects.
 * @remarks
 * <b>IBandSite</b> is used to host band objects, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ibandsite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBandSite extends IUnknown {
    /**
     * The interface identifier for IBandSite
     * @type {Guid}
     */
    static IID := Guid("{4cf504b0-de96-11d0-8b3f-00a0c911e8e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBandSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddBand         : IntPtr
        EnumBands       : IntPtr
        QueryBand       : IntPtr
        SetBandState    : IntPtr
        RemoveBand      : IntPtr
        GetBandObject   : IntPtr
        SetBandSiteInfo : IntPtr
        GetBandSiteInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBandSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a band to a band site object.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * The interface of a band site object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns the band ID in ShortFromResult(hresult).
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-addband
     */
    AddBand(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Enumerates the bands in a band site.
     * @param {Integer} uBand Type: <b>UINT</b>
     * 
     * Call the method with this parameter starting at 0 to
     * 				begin enumerating.  If this parameter is -1, the
     *        <i>pdwBandID</i> parameter is ignored and this method returns the count of the
     * 				bands in the band site.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * The address of a band ID variable that receives the band ID.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-enumbands
     */
    EnumBands(uBand) {
        result := ComCall(4, this, "uint", uBand, "uint*", &pdwBandID := 0, "HRESULT")
        return pdwBandID
    }

    /**
     * Gets information about a band in a band site.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The ID of the band object to query.
     * @param {Pointer<IDeskBand>} ppstb Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a>**</b>
     * 
     * Address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a> interface pointer that, when this method returns successfully, points to the <b>IDeskBand</b> object that represents the band. This value can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwState Type: <b>DWORD*</b>
     * 
     * Pointer to a <b>DWORD</b> value that, when this method returns successfully, receives the state of the band object. This state is a combination of BSSF_VISIBLE, BSSF_NOTITLE, and BSSF_UNDELETEABLE. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a> for more information on those flags. This value can be <b>NULL</b> if the state information is not needed.
     * @param {PWSTR} pszName Type: <b>LPWSTR</b>
     * 
     * Pointer to a buffer of <i>cchName</i> Unicode characters that, when this method returns successfully, receives the name of the band object.
     * @param {Integer} cchName Type: <b>int</b>
     * 
     * The size of the <i>pszName</i> buffer, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-queryband
     */
    QueryBand(dwBandID, ppstb, pdwState, pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwBandID, IDeskBand.Ptr, ppstb, pdwStateMarshal, pdwState, "ptr", pszName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * Set the state of a band in the band site.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The ID of the band to set.  If this parameter is -1, then
     * 				set the state of all bands in the band site.
     * @param {Integer} dwMask Type: <b>DWORD</b>
     * 
     * The mask of the states to set.
     * @param {Integer} dwState Type: <b>DWORD</b>
     * 
     * The state values to be set. These are combinations of
     * 				BSSF_* flags. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-setbandstate
     */
    SetBandState(dwBandID, dwMask, dwState) {
        result := ComCall(6, this, "uint", dwBandID, "uint", dwMask, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * Removes a band from the band site.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The ID of the band to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-removeband
     */
    RemoveBand(dwBandID) {
        result := ComCall(7, this, "uint", dwBandID, "HRESULT")
        return result
    }

    /**
     * Gets a specified band object from a band site.
     * @param {Integer} dwBandID Type: <b>DWORD</b>
     * 
     * The ID of the band object to get.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the object to obtain.
     * @returns {Pointer<Void>} Type: <b>VOID**</b>
     * 
     * The address of a pointer variable that receives a pointer
     * 				to the object requested.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-getbandobject
     */
    GetBandObject(dwBandID, riid) {
        result := ComCall(8, this, "uint", dwBandID, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Sets information about the band site.
     * @param {Pointer<BANDSITEINFO>} pbsinfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a> structure that receives
     * 				the band site information for the object. The
     * 				<b>dwMask</b> member of this structure
     * 				specifies what information is being set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-setbandsiteinfo
     */
    SetBandSiteInfo(pbsinfo) {
        result := ComCall(9, this, BANDSITEINFO.Ptr, pbsinfo, "HRESULT")
        return result
    }

    /**
     * Gets information about a band in the band site.
     * @param {Pointer<BANDSITEINFO>} pbsinfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo">BANDSITEINFO</a> structure that contains
     * 				the band site information for the object. The
     * 				<b>dwMask</b> member of this structure
     * 				specifies what information is being requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-getbandsiteinfo
     */
    GetBandSiteInfo(pbsinfo) {
        result := ComCall(10, this, BANDSITEINFO.Ptr, pbsinfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBandSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddBand := CallbackCreate(GetMethod(implObj, "AddBand"), flags, 2)
        this.vtbl.EnumBands := CallbackCreate(GetMethod(implObj, "EnumBands"), flags, 3)
        this.vtbl.QueryBand := CallbackCreate(GetMethod(implObj, "QueryBand"), flags, 6)
        this.vtbl.SetBandState := CallbackCreate(GetMethod(implObj, "SetBandState"), flags, 4)
        this.vtbl.RemoveBand := CallbackCreate(GetMethod(implObj, "RemoveBand"), flags, 2)
        this.vtbl.GetBandObject := CallbackCreate(GetMethod(implObj, "GetBandObject"), flags, 4)
        this.vtbl.SetBandSiteInfo := CallbackCreate(GetMethod(implObj, "SetBandSiteInfo"), flags, 2)
        this.vtbl.GetBandSiteInfo := CallbackCreate(GetMethod(implObj, "GetBandSiteInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddBand)
        CallbackFree(this.vtbl.EnumBands)
        CallbackFree(this.vtbl.QueryBand)
        CallbackFree(this.vtbl.SetBandState)
        CallbackFree(this.vtbl.RemoveBand)
        CallbackFree(this.vtbl.GetBandObject)
        CallbackFree(this.vtbl.SetBandSiteInfo)
        CallbackFree(this.vtbl.GetBandSiteInfo)
    }
}
