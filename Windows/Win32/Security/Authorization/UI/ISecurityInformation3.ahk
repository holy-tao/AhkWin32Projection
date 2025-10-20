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
     * 
     * @param {Pointer<PWSTR>} ppszResourceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation3-getfullresourcename
     */
    GetFullResourceName(ppszResourceName) {
        result := ComCall(3, this, "ptr", ppszResourceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} uPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation3-openelevatededitor
     */
    OpenElevatedEditor(hWnd, uPage) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "int", uPage, "HRESULT")
        return result
    }
}
