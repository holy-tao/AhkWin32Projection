#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPLibrarySharingServices interface provides methods to manage library sharing.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmplibrarysharingservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPLibrarySharingServices extends IUnknown {
    /**
     * The interface identifier for IWMPLibrarySharingServices
     * @type {Guid}
     */
    static IID := Guid("{82cba86b-9f04-474b-a365-d6dd1466e541}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPLibrarySharingServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        isLibraryShared         : IntPtr
        isLibrarySharingEnabled : IntPtr
        showLibrarySharing      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPLibrarySharingServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The isLibraryShared method retrieves a value indicating whether the user's library is shared.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<VARIANT_BOOL>} pvbShared Pointer to a <b>VARIANT_BOOL</b> that receives the result. <b>VARIANT_TRUE</b> indicates that the user's library is currently shared.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrarysharingservices-islibraryshared
     */
    isLibraryShared(pvbShared) {
        pvbSharedMarshal := pvbShared is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pvbSharedMarshal, pvbShared, "HRESULT")
        return result
    }

    /**
     * The isLibrarySharingEnabled method retrieves a value indicating whether the user has enabled library sharing in Windows Media Player.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled Pointer to a <b>VARIANT_BOOL</b> that receives the result. <b>VARIANT_TRUE</b> indicates that the user has enabled library sharing.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrarysharingservices-islibrarysharingenabled
     */
    isLibrarySharingEnabled(pvbEnabled) {
        pvbEnabledMarshal := pvbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, pvbEnabledMarshal, pvbEnabled, "HRESULT")
        return result
    }

    /**
     * The showLibrarySharing method displays the Windows Media Player Library Sharing dialog box.
     * @remarks
     * The <b>Library Sharing</b> dialog box enables the user to configure library sharing. Users can access this dialog box by pointing to <b>Tools</b>, then clicking <b>Options</b>, and then clicking <b>Configure Media Sharing</b> in the Windows Media Player menu; or by clicking the arrow below the <b>Library</b> tab and then clicking <b>Library Sharing</b>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrarysharingservices-showlibrarysharing
     */
    showLibrarySharing() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPLibrarySharingServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.isLibraryShared := CallbackCreate(GetMethod(implObj, "isLibraryShared"), flags, 2)
        this.vtbl.isLibrarySharingEnabled := CallbackCreate(GetMethod(implObj, "isLibrarySharingEnabled"), flags, 2)
        this.vtbl.showLibrarySharing := CallbackCreate(GetMethod(implObj, "showLibrarySharing"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.isLibraryShared)
        CallbackFree(this.vtbl.isLibrarySharingEnabled)
        CallbackFree(this.vtbl.showLibrarySharing)
    }
}
