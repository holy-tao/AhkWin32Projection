#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\UI\Controls\HPROPSHEETPAGE.ahk

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class UI {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static SI_EDIT_PERMS => 0

    /**
     * @type {Integer (Int32)}
     */
    static SI_EDIT_OWNER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SI_CONTAINER => 4

    /**
     * @type {Integer (Int32)}
     */
    static SI_READONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static SI_RESET => 32

    /**
     * @type {Integer (Int32)}
     */
    static SI_OWNER_READONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static SI_OWNER_RECURSE => 256

    /**
     * @type {Integer (Int32)}
     */
    static SI_NO_ACL_PROTECT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SI_NO_TREE_APPLY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SI_PAGE_TITLE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SI_SERVER_IS_DC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SI_RESET_DACL_TREE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SI_RESET_SACL_TREE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SI_OBJECT_GUID => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SI_ACCESS_SPECIFIC => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SI_ACCESS_GENERAL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SI_ACCESS_CONTAINER => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SI_ACCESS_PROPERTY => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DOBJ_RES_CONT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOBJ_RES_ROOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOBJ_VOL_NTACLS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOBJ_COND_NTACLS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOBJ_RIBBON_LAUNCH => 16

    /**
     * @type {String}
     */
    static CFSTR_ACLUI_SID_INFO_LIST => "CFSTR_ACLUI_SID_INFO_LIST"

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_OBJECT_ID_OBJECT_SD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_OBJECT_ID_SHARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_OBJECT_ID_CENTRAL_POLICY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE => 4
;@endregion Constants

;@region Methods
    /**
     * Creates a basic security property page that enables the user to view and edit the access rights allowed or denied by the access control entries (ACEs) in an object's discretionary access control list (DACL).
     * @param {ISecurityInformation} psi A pointer to your implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
     * @returns {HPROPSHEETPAGE} If the function succeeds, the function returns a handle to a basic security property page.
     * 						
     * 
     * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-createsecuritypage
     * @since windows5.1.2600
     */
    static CreateSecurityPage(psi) {
        A_LastError := 0

        result := DllCall("ACLUI.dll\CreateSecurityPage", "ptr", psi, "ptr")
        if(A_LastError)
            throw OSError()

        return HPROPSHEETPAGE({Value: result}, True)
    }

    /**
     * Displays a property sheet that contains a basic security property page. This property page enables the user to view and edit the access rights allowed or denied by the ACEs in an object's DACL.
     * @param {HWND} hwndOwner A handle to the window that owns the property sheet. This parameter can be <b>NULL</b>.
     * @param {ISecurityInformation} psi A pointer to your implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-editsecurity
     * @since windows5.1.2600
     */
    static EditSecurity(hwndOwner, psi) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        A_LastError := 0

        result := DllCall("ACLUI.dll\EditSecurity", "ptr", hwndOwner, "ptr", psi, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Extends the EditSecurity function to include the security page type when displaying the property sheet that contains a basic security property page.
     * @param {HWND} hwndOwner A handle to the window that owns the property sheet. This parameter can be <b>NULL</b>.
     * @param {ISecurityInformation} psi A pointer to your implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
     * @param {Integer} uSIPage A value of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ne-aclui-si_page_type">SI_PAGE_TYPE</a> enumeration that indicates the page type on which to display the elevated access control editor.
     * @returns {HRESULT} If the function succeeds, the return value is S_OK.
     * 
     * If the function fails, any other <b>HRESULT</b> value indicates an error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-editsecurityadvanced
     * @since windows6.0.6000
     */
    static EditSecurityAdvanced(hwndOwner, psi, uSIPage) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("ACLUI.dll\EditSecurityAdvanced", "ptr", hwndOwner, "ptr", psi, "int", uSIPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
