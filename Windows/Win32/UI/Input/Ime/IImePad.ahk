#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IImePad interface inserts text into apps from IMEPadApplets that implement the IImePadApplet interface.
 * @see https://docs.microsoft.com/windows/win32/api//imepad/nn-imepad-iimepad
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IImePad extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImePad
     * @type {Guid}
     */
    static IID => Guid("{5d8e643a-c3a9-11d1-afef-00805f0c8b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Request"]

    /**
     * 
     * @param {IImePadApplet} pIImePadApplet 
     * @param {Integer} reqId 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimepad-request
     */
    Request(pIImePadApplet, reqId, wParam, lParam) {
        result := ComCall(3, this, "ptr", pIImePadApplet, "int", reqId, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
