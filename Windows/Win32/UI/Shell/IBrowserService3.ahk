#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBrowserService2.ahk

/**
 * Deprecated. (IBrowserService3)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice2">IBrowserService2</a> interfaces, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api//content/shdeprecated/nn-shdeprecated-ibrowserservice3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserService3 extends IBrowserService2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrowserService3
     * @type {Guid}
     */
    static IID => Guid("{27d7ce21-762d-48f3-86f3-40e2fd3749c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 95

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["_PositionViewWindow", "IEParseDisplayNameEx"]

    /**
     * Deprecated. Used in view size negotiations. This method is called by _UpdateViewRectSize after determining the available dimensions.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * The handle of the view window.
     * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the available dimensions.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shdeprecated/nf-shdeprecated-ibrowserservice3-_positionviewwindow
     */
    _PositionViewWindow(hwnd_, prc) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(95, this, "ptr", hwnd_, "ptr", prc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deprecated. Parses a URL into a pointer to an item identifier list (PIDL). (IBrowserService3.IEParseDisplayNameEx)
     * @remarks
     * This method replaces <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nf-shdeprecated-ibrowserservice-ieparsedisplayname">IEParseDisplayName</a>.
     * @param {Integer} uiCP Type: <b>UINT</b>
     * 
     * The code page (for example, CP_ACP, the system default code page).
     * @param {PWSTR} pwszPath Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer containing the URL to parse, as a Unicode string.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The following value, if desired.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The PIDL created from the parsed URL.
     * @see https://learn.microsoft.com/windows/win32/api//content/shdeprecated/nf-shdeprecated-ibrowserservice3-ieparsedisplaynameex
     */
    IEParseDisplayNameEx(uiCP, pwszPath, dwFlags) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(96, this, "uint", uiCP, "ptr", pwszPath, "uint", dwFlags, "ptr*", &ppidlOut := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppidlOut
    }
}
