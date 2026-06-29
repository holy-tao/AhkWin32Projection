#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\CARET_DIRECTION.ahk" { CARET_DIRECTION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDisplayPointer.ahk" { IDisplayPointer }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCaret extends IUnknown {
    /**
     * The interface identifier for IHTMLCaret
     * @type {Guid}
     */
    static IID := Guid("{3050f604-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCaret interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveCaretToPointer        : IntPtr
        MoveCaretToPointerEx      : IntPtr
        MoveMarkupPointerToCaret  : IntPtr
        MoveDisplayPointerToCaret : IntPtr
        IsVisible                 : IntPtr
        Show                      : IntPtr
        Hide                      : IntPtr
        InsertText                : IntPtr
        ScrollIntoView            : IntPtr
        GetLocation               : IntPtr
        GetCaretDirection         : IntPtr
        SetCaretDirection         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCaret.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fScrollIntoView 
     * @param {CARET_DIRECTION} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointer(pDispPointer, fScrollIntoView, eDir) {
        result := ComCall(3, this, "ptr", pDispPointer, BOOL, fScrollIntoView, CARET_DIRECTION, eDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fVisible 
     * @param {BOOL} fScrollIntoView 
     * @param {CARET_DIRECTION} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointerEx(pDispPointer, fVisible, fScrollIntoView, eDir) {
        result := ComCall(4, this, "ptr", pDispPointer, BOOL, fVisible, BOOL, fScrollIntoView, CARET_DIRECTION, eDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIMarkupPointer 
     * @returns {HRESULT} 
     */
    MoveMarkupPointerToCaret(pIMarkupPointer) {
        result := ComCall(5, this, "ptr", pIMarkupPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveDisplayPointerToCaret(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsVisible() {
        result := ComCall(7, this, BOOL.Ptr, &pIsVisible := 0, "HRESULT")
        return pIsVisible
    }

    /**
     * 
     * @param {BOOL} fScrollIntoView 
     * @returns {HRESULT} 
     */
    Show(fScrollIntoView) {
        result := ComCall(8, this, BOOL, fScrollIntoView, "HRESULT")
        return result
    }

    /**
     * This article provides a detailed overview of the hide meeting update option property with additional remarks.
     * @remarks
     * To provide any of the store functionality, the store provider must implement [IMAPIProp : IUnknown](imapipropiunknown.md) and return a valid property tag for any of these properties passed to an [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) call. When the property tag for any of these properties is passed to [IMAPIProp::GetProps](imapiprop-getprops.md), the store provider must also return the correct property value. Store providers can call [HrGetOneProp](hrgetoneprop.md) and [HrSetOneProp](hrsetoneprop.md) to get or set these properties. 
     *   
     * To retrieve the value of this property, the client should first use [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) to obtain the property tag, and then specify this property tag in [IMAPIProp::GetProps](imapiprop-getprops.md) to get the value. When calling [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md), specify the following values for the [MAPINAMEID](mapinameid.md) structure pointed at by the input parameter  _lppPropNames_:
     *   
     * |Property |Value |
     * |:-----|:-----|
     * |lpGuid:  <br/> |PS_PUBLIC_STRINGS  <br/> |
     * |ulKind:  <br/> |MNID_STRING  <br/> |
     * |Kind.lpwstrName:  <br/> |L"urn:schemas-microsoft-com:office:outlook#allornonemtgupdatedlg"  <br/> |
     *    
     * A store provider that uses a server to send meeting updates can modify the **Send Update to Attendees** dialog box. This functionality is useful because when the server sends a meeting update, the server does not know which attendees have been added or deleted by the user since the initial meeting request. When this property is **true**, the **Send update only to added or deleted attendees** option is not displayed in the **Send Update to Attendees** dialog box. 
     *   
     * This property is ignored if the version of Outlook is earlier than Microsoft Office Outlook 2003 Service Pack 1, or if its value is **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hide-meeting-update-option-property
     */
    Hide() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pText 
     * @param {Integer} lLen 
     * @returns {HRESULT} 
     */
    InsertText(pText, lLen) {
        pText := pText is String ? StrPtr(pText) : pText

        result := ComCall(10, this, "ptr", pText, "int", lLen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fTranslate 
     * @returns {POINT} 
     */
    GetLocation(fTranslate) {
        pPoint := POINT()
        result := ComCall(12, this, POINT.Ptr, pPoint, BOOL, fTranslate, "HRESULT")
        return pPoint
    }

    /**
     * 
     * @returns {CARET_DIRECTION} 
     */
    GetCaretDirection() {
        result := ComCall(13, this, "int*", &peDir := 0, "HRESULT")
        return peDir
    }

    /**
     * 
     * @param {CARET_DIRECTION} eDir 
     * @returns {HRESULT} 
     */
    SetCaretDirection(eDir) {
        result := ComCall(14, this, CARET_DIRECTION, eDir, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLCaret.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveCaretToPointer := CallbackCreate(GetMethod(implObj, "MoveCaretToPointer"), flags, 4)
        this.vtbl.MoveCaretToPointerEx := CallbackCreate(GetMethod(implObj, "MoveCaretToPointerEx"), flags, 5)
        this.vtbl.MoveMarkupPointerToCaret := CallbackCreate(GetMethod(implObj, "MoveMarkupPointerToCaret"), flags, 2)
        this.vtbl.MoveDisplayPointerToCaret := CallbackCreate(GetMethod(implObj, "MoveDisplayPointerToCaret"), flags, 2)
        this.vtbl.IsVisible := CallbackCreate(GetMethod(implObj, "IsVisible"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
        this.vtbl.Hide := CallbackCreate(GetMethod(implObj, "Hide"), flags, 1)
        this.vtbl.InsertText := CallbackCreate(GetMethod(implObj, "InsertText"), flags, 3)
        this.vtbl.ScrollIntoView := CallbackCreate(GetMethod(implObj, "ScrollIntoView"), flags, 1)
        this.vtbl.GetLocation := CallbackCreate(GetMethod(implObj, "GetLocation"), flags, 3)
        this.vtbl.GetCaretDirection := CallbackCreate(GetMethod(implObj, "GetCaretDirection"), flags, 2)
        this.vtbl.SetCaretDirection := CallbackCreate(GetMethod(implObj, "SetCaretDirection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveCaretToPointer)
        CallbackFree(this.vtbl.MoveCaretToPointerEx)
        CallbackFree(this.vtbl.MoveMarkupPointerToCaret)
        CallbackFree(this.vtbl.MoveDisplayPointerToCaret)
        CallbackFree(this.vtbl.IsVisible)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.Hide)
        CallbackFree(this.vtbl.InsertText)
        CallbackFree(this.vtbl.ScrollIntoView)
        CallbackFree(this.vtbl.GetLocation)
        CallbackFree(this.vtbl.GetCaretDirection)
        CallbackFree(this.vtbl.SetCaretDirection)
    }
}
