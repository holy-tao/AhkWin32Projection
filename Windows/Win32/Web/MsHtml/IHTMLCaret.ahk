#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCaret extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCaret
     * @type {Guid}
     */
    static IID => Guid("{3050f604-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveCaretToPointer", "MoveCaretToPointerEx", "MoveMarkupPointerToCaret", "MoveDisplayPointerToCaret", "IsVisible", "Show", "Hide", "InsertText", "ScrollIntoView", "GetLocation", "GetCaretDirection", "SetCaretDirection"]

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointer(pDispPointer, fScrollIntoView, eDir) {
        result := ComCall(3, this, "ptr", pDispPointer, "int", fScrollIntoView, "int", eDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @param {BOOL} fVisible 
     * @param {BOOL} fScrollIntoView 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    MoveCaretToPointerEx(pDispPointer, fVisible, fScrollIntoView, eDir) {
        result := ComCall(4, this, "ptr", pDispPointer, "int", fVisible, "int", fScrollIntoView, "int", eDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIMarkupPointer 
     * @returns {HRESULT} 
     */
    MoveMarkupPointerToCaret(pIMarkupPointer) {
        result := ComCall(5, this, "ptr", pIMarkupPointer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveDisplayPointerToCaret(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsVisible() {
        result := ComCall(7, this, "int*", &pIsVisible := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsVisible
    }

    /**
     * Makes the caret visible on the screen at the caret's current position. When the caret becomes visible, it begins flashing automatically.
     * @remarks
     * <b>ShowCaret</b> shows the caret only if the specified window owns the caret, the caret has a shape, and the caret has not been hidden two or more times in a row. If one or more of these conditions is not met, <b>ShowCaret</b> does nothing and returns <b>FALSE</b>. 
     * 
     * Hiding is cumulative. If your application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-hidecaret">HideCaret</a> five times in a row, it must also call <b>ShowCaret</b> five times before the caret reappears. 
     * 
     * The system provides one caret per queue. A window should create a caret only when it has the keyboard focus or is active. The window should destroy the caret before losing the keyboard focus or becoming inactive.
     * @param {BOOL} fScrollIntoView 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-showcaret
     */
    Show(fScrollIntoView) {
        result := ComCall(8, this, "int", fScrollIntoView, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/hide-meeting-update-option-property
     */
    Hide() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(10, this, "ptr", pText, "int", lLen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BOOL} fTranslate 
     * @returns {POINT} 
     */
    GetLocation(fTranslate) {
        pPoint := POINT()
        result := ComCall(12, this, "ptr", pPoint, "int", fTranslate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPoint
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCaretDirection() {
        result := ComCall(13, this, "int*", &peDir := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return peDir
    }

    /**
     * 
     * @param {Integer} eDir 
     * @returns {HRESULT} 
     */
    SetCaretDirection(eDir) {
        result := ComCall(14, this, "int", eDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
