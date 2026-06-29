#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPainterEventInfo extends IUnknown {
    /**
     * The interface identifier for IHTMLPainterEventInfo
     * @type {Guid}
     */
    static IID := Guid("{3050f6df-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPainterEventInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventInfoFlags : IntPtr
        GetEventTarget    : IntPtr
        SetCursor         : IntPtr
        StringFromPartID  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPainterEventInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEventInfoFlags() {
        result := ComCall(3, this, "int*", &plEventInfoFlags := 0, "HRESULT")
        return plEventInfoFlags
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @returns {HRESULT} 
     */
    GetEventTarget(ppElement) {
        result := ComCall(4, this, IHTMLElement.Ptr, ppElement, "HRESULT")
        return result
    }

    /**
     * Sets the cursor shape.
     * @remarks
     * The cursor is set only if the new cursor is different from the previous cursor; otherwise, the function returns immediately. 
     * 
     * The cursor is a shared resource. A window should set the cursor shape only when the cursor is in its client area or when the window is capturing mouse input. In systems without a mouse, the window should restore the previous cursor before the cursor leaves the client area or before it relinquishes control to another window. 
     * 
     * If your application must set the cursor while it is in a window, make sure the class cursor for the specified window's class is set to <b>NULL</b>. If the class cursor is not <b>NULL</b>, the system restores the class cursor each time the mouse is moved. 
     * 
     * The cursor is not shown on the screen if the internal cursor display count is less than zero. This occurs if the application uses the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showcursor">ShowCursor</a> function to hide the cursor more times than to show the cursor.
     * @param {Integer} lPartID 
     * @returns {HRESULT} Type: <b>HCURSOR</b>
     * 
     * The return value is the handle to the previous cursor, if there was one. 
     * 
     * If there was no previous cursor, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setcursor
     */
    SetCursor(lPartID) {
        result := ComCall(5, this, "int", lPartID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPartID 
     * @returns {BSTR} 
     */
    StringFromPartID(lPartID) {
        pbstrPart := BSTR.Owned()
        result := ComCall(6, this, "int", lPartID, BSTR.Ptr, pbstrPart, "HRESULT")
        return pbstrPart
    }

    Query(iid) {
        if (IHTMLPainterEventInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventInfoFlags := CallbackCreate(GetMethod(implObj, "GetEventInfoFlags"), flags, 2)
        this.vtbl.GetEventTarget := CallbackCreate(GetMethod(implObj, "GetEventTarget"), flags, 2)
        this.vtbl.SetCursor := CallbackCreate(GetMethod(implObj, "SetCursor"), flags, 2)
        this.vtbl.StringFromPartID := CallbackCreate(GetMethod(implObj, "StringFromPartID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventInfoFlags)
        CallbackFree(this.vtbl.GetEventTarget)
        CallbackFree(this.vtbl.SetCursor)
        CallbackFree(this.vtbl.StringFromPartID)
    }
}
