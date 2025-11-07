#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes configuration methods that are implemented by third parties.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcproviderconfig
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCProviderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCProviderConfig
     * @type {Guid}
     */
    static IID => Guid("{bef54196-2d02-4a26-b6e5-d65af295d0f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserSummary", "Configure", "RequestOverride"]

    /**
     * 
     * @param {BSTR} bstrSID 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-getusersummary
     */
    GetUserSummary(bstrSID) {
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        pbstrUserSummary := BSTR()
        result := ComCall(3, this, "ptr", bstrSID, "ptr", pbstrUserSummary, "HRESULT")
        return pbstrUserSummary
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {BSTR} bstrSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-configure
     */
    Configure(hWnd, bstrSID) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        bstrSID := bstrSID is String ? BSTR.Alloc(bstrSID).Value : bstrSID

        result := ComCall(4, this, "ptr", hWnd, "ptr", bstrSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {BSTR} bstrPath 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcproviderconfig-requestoverride
     */
    RequestOverride(hWnd, bstrPath, dwFlags) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(5, this, "ptr", hWnd, "ptr", bstrPath, "uint", dwFlags, "HRESULT")
        return result
    }
}
