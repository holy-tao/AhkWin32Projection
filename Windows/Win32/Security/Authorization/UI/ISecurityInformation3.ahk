#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods necessary for displaying an elevated access control editor when a user clicks the Edit button on an access control editor page that displays an image of a shield on that Edit button.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityinformation3
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityInformation3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInformation3
     * @type {Guid}
     */
    static IID => Guid("{e2cdc9cc-31bd-4f8f-8c8b-b641af516a1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFullResourceName", "OpenElevatedEditor"]

    /**
     * Retrieves the full path and file name of the object associated with the access control editor that is displayed by calling the OpenElevatedEditor method.
     * @returns {PWSTR} The full path and file name of the object for which permissions are to be edited.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation3-getfullresourcename
     */
    GetFullResourceName() {
        result := ComCall(3, this, "ptr*", &ppszResourceName := 0, "HRESULT")
        return ppszResourceName
    }

    /**
     * Opens an access control editor when a user clicks the Edit button on an access control editor page that displays an image of a shield on that Edit button.
     * @param {HWND} hWnd The parent window of the access control editor.
     * @param {Integer} uPage A value of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ne-aclui-si_page_type">SI_PAGE_TYPE</a> enumeration that indicates the page type on which to display the elevated access control editor.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation3-openelevatededitor
     */
    OpenElevatedEditor(hWnd, uPage) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "int", uPage, "HRESULT")
        return result
    }
}
