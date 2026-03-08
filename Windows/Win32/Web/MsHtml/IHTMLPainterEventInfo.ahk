#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPainterEventInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPainterEventInfo
     * @type {Guid}
     */
    static IID => Guid("{3050f6df-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventInfoFlags", "GetEventTarget", "SetCursor", "StringFromPartID"]

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
        result := ComCall(4, this, "ptr*", ppElement, "HRESULT")
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
        pbstrPart := BSTR()
        result := ComCall(6, this, "int", lPartID, "ptr", pbstrPart, "HRESULT")
        return pbstrPart
    }
}
