#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class ITipAutoCompleteProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipAutoCompleteProvider
     * @type {Guid}
     */
    static IID => Guid("{7c6cf46d-8404-46b9-ad33-f5b6036d4007}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdatePendingText", "Show"]

    /**
     * 
     * @param {BSTR} bstrPendingText 
     * @returns {HRESULT} 
     */
    UpdatePendingText(bstrPendingText) {
        if(bstrPendingText is String) {
            pin := BSTR.Alloc(bstrPendingText)
            bstrPendingText := pin.Value
        }

        result := ComCall(3, this, "ptr", bstrPendingText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Makes the caret visible on the screen at the caret's current position. When the caret becomes visible, it begins flashing automatically.
     * @remarks
     * <b>ShowCaret</b> shows the caret only if the specified window owns the caret, the caret has a shape, and the caret has not been hidden two or more times in a row. If one or more of these conditions is not met, <b>ShowCaret</b> does nothing and returns <b>FALSE</b>. 
     * 
     * Hiding is cumulative. If your application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-hidecaret">HideCaret</a> five times in a row, it must also call <b>ShowCaret</b> five times before the caret reappears. 
     * 
     * The system provides one caret per queue. A window should create a caret only when it has the keyboard focus or is active. The window should destroy the caret before losing the keyboard focus or becoming inactive.
     * @param {BOOL} fShow 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-showcaret
     */
    Show(fShow) {
        result := ComCall(4, this, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
