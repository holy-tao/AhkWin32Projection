#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IconIdentifier.ahk" { IconIdentifier }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMessageView interface is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-imessageview
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IMessageView extends IUnknown {
    /**
     * The interface identifier for IMessageView
     * @type {Guid}
     */
    static IID := Guid("{80f94174-fccc-11d2-b991-00c04f8ecd78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMessageView interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTitleText : IntPtr
        SetBodyText  : IntPtr
        SetIcon      : IntPtr
        Clear        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMessageView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IMessageView::SetTitleText method enables a snap-in to set the title text for the result pane message displayed using the MMC message OCX control.
     * @remarks
     * MMC creates its own copies of the strings passed to it when the snap-in calls the IMessageView::SetTitleText and IMessageView::SetBodyText methods. The snap-in can release the resources at any time after calling 
     * <b>SetTitleText</b> and 
     * <b>SetBodyText</b>.
     * @param {PWSTR} pszTitleText A pointer to a null-terminated string that contains the title text for the result pane message.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-settitletext
     */
    SetTitleText(pszTitleText) {
        pszTitleText := pszTitleText is String ? StrPtr(pszTitleText) : pszTitleText

        result := ComCall(3, this, "ptr", pszTitleText, "HRESULT")
        return result
    }

    /**
     * The IMessageView::SetBodyText method enables a snap-in to set the body text for the result pane message displayed using the MMC message OCX control.
     * @remarks
     * MMC creates its own copies of the strings passed to it when the snap-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-settitletext">IMessageView::SetTitleText</a> and <b>IMessageView::SetBodyText</b> methods. The snap-in can release the resources at any time after calling 
     * <b>SetTitleText</b> and 
     * SetBodyText.
     * @param {PWSTR} pszBodyText A pointer to a null-terminated string that contains the body text for the result pane message.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-setbodytext
     */
    SetBodyText(pszBodyText) {
        pszBodyText := pszBodyText is String ? StrPtr(pszBodyText) : pszBodyText

        result := ComCall(4, this, "ptr", pszBodyText, "HRESULT")
        return result
    }

    /**
     * The IMessageView::SetIcon method enables a snap-in to set the icon for the result pane message displayed using the MMC message OCX control.
     * @param {IconIdentifier} id A value that specifies the type of icon for the result pane message. The value is taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-iconidentifier">IconIdentifier</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-seticon
     */
    SetIcon(id) {
        result := ComCall(5, this, IconIdentifier, id, "HRESULT")
        return result
    }

    /**
     * The IMessageView::Clear method enables a snap-in to clear the title, text, and icon of the result pane message displayed using the MMC message OCX control.
     * @remarks
     * The 
     * Clear method provides a way to reset the content of the message, but the snap-in is not required to call this method to release resources. MMC creates its own copies of the strings passed to it when the snap-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-settitletext">IMessageView::SetTitleText</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-imessageview-setbodytext">IMessageView::SetBodyText</a> methods. The snap-in can release the resources after calling 
     * SetTitleText and 
     * SetBodyText.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-imessageview-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMessageView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTitleText := CallbackCreate(GetMethod(implObj, "SetTitleText"), flags, 2)
        this.vtbl.SetBodyText := CallbackCreate(GetMethod(implObj, "SetBodyText"), flags, 2)
        this.vtbl.SetIcon := CallbackCreate(GetMethod(implObj, "SetIcon"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTitleText)
        CallbackFree(this.vtbl.SetBodyText)
        CallbackFree(this.vtbl.SetIcon)
        CallbackFree(this.vtbl.Clear)
    }
}
