#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBrowserService2.ahk

/**
 * Deprecated.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice2">IBrowserService2</a> interfaces, from which it inherits.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ibrowserservice3
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
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice3-_positionviewwindow
     */
    _PositionViewWindow(hwnd, prc) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(95, this, "ptr", hwnd, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCP 
     * @param {PWSTR} pwszPath 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice3-ieparsedisplaynameex
     */
    IEParseDisplayNameEx(uiCP, pwszPath, dwFlags, ppidlOut) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        ppidlOutMarshal := ppidlOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(96, this, "uint", uiCP, "ptr", pwszPath, "uint", dwFlags, ppidlOutMarshal, ppidlOut, "HRESULT")
        return result
    }
}
