#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\UI\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * Provides the main features for a property page site object.
 * @remarks
 * For each property page created within a property frame, the frame creates a property page site to provide information to the property page and to receive notifications from the page when changes occur. This latter notification is used to initiate a call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-ispagedirty">IPropertyPage::IsPageDirty</a>, the return value of which is then used to enable or disable the frame's <b>Apply</b> button.
 * 
 * <h3><a id="OLE_Implementation"></a><a id="ole_implementation"></a><a id="OLE_IMPLEMENTATION"></a>OLE Implementation</h3>
 * The system provides an implementation of the <b>IPropertyPageSite</b> interface through the <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframe">OleCreatePropertyFrame</a> or <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframeindirect">OleCreatePropertyFrameIndirect</a> functions. The frame implementation provided through these functions only implements the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-onstatuschange">OnStatusChange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">GetLocaleID</a> methods. The <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getpagecontainer">GetPageContainer</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-translateaccelerator">TranslateAccelerator</a> methods return E_NOTIMPL.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipropertypagesite
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPropertyPageSite extends IUnknown {
    /**
     * The interface identifier for IPropertyPageSite
     * @type {Guid}
     */
    static IID := Guid("{b196b28c-bab4-101a-b69c-00aa00341d07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyPageSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStatusChange       : IntPtr
        GetLocaleID          : IntPtr
        GetPageContainer     : IntPtr
        TranslateAccelerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyPageSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Informs the frame that the property page managed by this site has changed its state, that is, one or more property values have been changed in the page. Property pages should call this method whenever changes occur in their dialog boxes.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-onstatuschange
     */
    OnStatusChange(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the locale identifier (an LCID) that a property page can use to adjust its locale-specific settings.
     * @returns {Integer} A pointer to a variable that receives the locale identifier. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid
     */
    GetLocaleID() {
        result := ComCall(4, this, "uint*", &pLocaleID := 0, "HRESULT")
        return pLocaleID
    }

    /**
     * Retrieves a pointer to the object representing the entire property frame dialog box that contains all the pages. Calling this method could potentially allow one page to navigate to another.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer variable that receives the interface pointer to the container object. If an error occurs, the implementation must set *<i>ppUnk</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-getpagecontainer
     */
    GetPageContainer() {
        result := ComCall(5, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * Passes a keystroke to the property frame for processing.
     * @param {Pointer<MSG>} pMsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure to be processed.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page site did not process the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page site does not support keyboard processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypagesite-translateaccelerator
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(6, this, MSG.Ptr, pMsg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyPageSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStatusChange := CallbackCreate(GetMethod(implObj, "OnStatusChange"), flags, 2)
        this.vtbl.GetLocaleID := CallbackCreate(GetMethod(implObj, "GetLocaleID"), flags, 2)
        this.vtbl.GetPageContainer := CallbackCreate(GetMethod(implObj, "GetPageContainer"), flags, 2)
        this.vtbl.TranslateAccelerator := CallbackCreate(GetMethod(implObj, "TranslateAccelerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStatusChange)
        CallbackFree(this.vtbl.GetLocaleID)
        CallbackFree(this.vtbl.GetPageContainer)
        CallbackFree(this.vtbl.TranslateAccelerator)
    }
}
