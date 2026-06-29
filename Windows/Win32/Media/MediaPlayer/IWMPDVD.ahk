#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPDVD interface provides methods for working with DVDs.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpdvd
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPDVD extends IDispatch {
    /**
     * The interface identifier for IWMPDVD
     * @type {Guid}
     */
    static IID := Guid("{8da61686-4668-4a5c-ae5d-803193293dbe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPDVD interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_isAvailable : IntPtr
        get_domain      : IntPtr
        topMenu         : IntPtr
        titleMenu       : IntPtr
        back            : IntPtr
        resume          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPDVD.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    domain {
        get => this.get_domain()
    }

    /**
     * The get_isAvailable method indicates whether a specified type of information is available or a specified action can be performed.
     * @remarks
     * The DVD features of Windows Media Player will not work on computers that do not have a DVD decoder installed. You can determine whether a decoder is available by calling the <b>get_isAvailable</b> method and passing in the <b>BSTR</b> value "dvdDecoder".
     * 
     * Every DVD is authored differently. The methods available during DVD playback and navigation depend on how the DVD is authored.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable Pointer to a <b>VARIANT_BOOL</b> that indicates whether the specified parameter is available.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, BSTR, bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The get_domain method retrieves the current domain of the DVD.
     * @remarks
     * Every DVD is authored differently. Some DVDs do not contain the firstPlay, videoManagerMenu, or videoTitleSetMenu domains.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
     * @param {Pointer<BSTR>} strDomain 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-get_domain
     */
    get_domain(strDomain) {
        result := ComCall(8, this, BSTR.Ptr, strDomain, "HRESULT")
        return result
    }

    /**
     * The topMenu method stops playback and displays the top (or root) menu for the current title.
     * @remarks
     * Every DVD is authored differently. The DVD must contain a menu for this method to work. Some DVDs are authored so that the <b>topMenu</b> and <b>IWMPDVD::titleMenu</b> methods open the same menu. The <b>topMenu</b> method usually invokes the top (or root) menu, but it may invoke the title menu if there is no root menu available.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-topmenu
     */
    topMenu() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The titleMenu method stops playback and displays the title menu.
     * @remarks
     * Every DVD is authored differently. The DVD must contain a menu for this method to work. Some DVDs are authored so that the <b>IWMPDVD::topMenu</b> and <b>titleMenu</b> methods open the same menu. The <b>titleMenu</b> method usually invokes the title menu, but it may invoke the top menu if there is no title menu available.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-titlemenu
     */
    titleMenu() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The back method returns the display from a submenu to its parent menu.
     * @remarks
     * Every DVD is authored differently. Some DVDs are authored so that the <b>back</b> method is available from the root menu, but when invoked, it will do nothing.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-back
     */
    back() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The resume method returns to playback mode from menu mode at the same title position as when the menu was invoked.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always returns S_OK, but does not perform the intended operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpdvd-resume
     */
    resume() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPDVD.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_isAvailable := CallbackCreate(GetMethod(implObj, "get_isAvailable"), flags, 3)
        this.vtbl.get_domain := CallbackCreate(GetMethod(implObj, "get_domain"), flags, 2)
        this.vtbl.topMenu := CallbackCreate(GetMethod(implObj, "topMenu"), flags, 1)
        this.vtbl.titleMenu := CallbackCreate(GetMethod(implObj, "titleMenu"), flags, 1)
        this.vtbl.back := CallbackCreate(GetMethod(implObj, "back"), flags, 1)
        this.vtbl.resume := CallbackCreate(GetMethod(implObj, "resume"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_isAvailable)
        CallbackFree(this.vtbl.get_domain)
        CallbackFree(this.vtbl.topMenu)
        CallbackFree(this.vtbl.titleMenu)
        CallbackFree(this.vtbl.back)
        CallbackFree(this.vtbl.resume)
    }
}
