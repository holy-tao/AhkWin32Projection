#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\ISecurityInformation.ahk" { ISecurityInformation }
#Import ".\SI_PAGE_TYPE.ahk" { SI_PAGE_TYPE }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 */

;@region Functions
/**
 * Creates a basic security property page that enables the user to view and edit the access rights allowed or denied by the access control entries (ACEs) in an object's discretionary access control list (DACL).
 * @remarks
 * During the property page initialization, the system calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getsecurity">ISecurityInformation::GetSecurity</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-setsecurity">ISecurityInformation::SetSecurity</a> methods to determine whether the user has permission to edit the object's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. The system displays an error message if the user does not have permission.
 * 
 * The basic security property page can include an <b>Advanced</b> button for displaying the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/advanced-security-property-sheet">advanced security property sheet</a>. This advanced security property sheet can contain three additional property pages that enable the user to view and edit the object's DACL, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), and owner.
 * @param {ISecurityInformation} psi A pointer to your implementation of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
 * @returns {HPROPSHEETPAGE} If the function succeeds, the function returns a handle to a basic security property page.
 * 						
 * 
 * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-createsecuritypage
 * @since windows5.1.2600
 */
export CreateSecurityPage(psi) {
    A_LastError := 0

    result := DllCall("ACLUI.dll\CreateSecurityPage", "ptr", psi, HPROPSHEETPAGE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Displays a property sheet that contains a basic security property page. This property page enables the user to view and edit the access rights allowed or denied by the ACEs in an object's DACL.
 * @remarks
 * The <b>EditSecurity</b> function calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-createsecuritypage">CreateSecurityPage</a> function to create a basic security property page.
 * 
 * During the property page initialization, the system calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getsecurity">ISecurityInformation::GetSecurity</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-setsecurity">ISecurityInformation::SetSecurity</a> methods to determine whether the user has permission to edit the object's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. The system displays an error message if the user does not have permission.
 * 
 * The basic security property page can include an <b>Advanced</b> button for displaying the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/advanced-security-property-sheet">advanced security property sheet</a>. This advanced security property sheet can contain three additional property pages that enable the user to view and edit the object's DACL, SACL, and owner.
 * @param {HWND} hwndOwner A handle to the window that owns the property sheet. This parameter can be <b>NULL</b>.
 * @param {ISecurityInformation} psi A pointer to your implementation of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-editsecurity
 * @since windows5.1.2600
 */
export EditSecurity(hwndOwner, psi) {
    A_LastError := 0

    result := DllCall("ACLUI.dll\EditSecurity", HWND, hwndOwner, "ptr", psi, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Extends the EditSecurity function to include the security page type when displaying the property sheet that contains a basic security property page.
 * @param {HWND} hwndOwner A handle to the window that owns the property sheet. This parameter can be <b>NULL</b>.
 * @param {ISecurityInformation} psi A pointer to your implementation of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. The system calls the interface methods to retrieve information about the object being edited and to return the user's input.
 * @param {SI_PAGE_TYPE} uSIPage A value of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ne-aclui-si_page_type">SI_PAGE_TYPE</a> enumeration that indicates the page type on which to display the elevated access control editor.
 * @returns {HRESULT} If the function succeeds, the return value is S_OK.
 * 
 * If the function fails, any other <b>HRESULT</b> value indicates an error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-editsecurityadvanced
 * @since windows6.0.6000
 */
export EditSecurityAdvanced(hwndOwner, psi, uSIPage) {
    result := DllCall("ACLUI.dll\EditSecurityAdvanced", HWND, hwndOwner, "ptr", psi, SI_PAGE_TYPE, uSIPage, "HRESULT")
    return result
}

;@endregion Functions
