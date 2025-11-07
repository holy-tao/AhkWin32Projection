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
     * @param {Integer} lPartID 
     * @returns {HRESULT} Type: <b>HCURSOR</b>
     * 
     * The return value is the handle to the previous cursor, if there was one. 
     * 
     * If there was no previous cursor, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setcursor
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
