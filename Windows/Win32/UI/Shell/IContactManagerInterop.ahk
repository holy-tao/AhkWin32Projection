#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables access to ContactManager methods in an app that manages multiple windows.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontactmanagerinterop
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContactManagerInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{99eacba7-e073-43b6-a896-55afe48a0833}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContactCardForWindow"]

    /**
     * Displays the UI for a contact on the specified window.
     * @param {HWND} appWindow Type: <b>HWND</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> of the foreground window of the app from which the contact card is launched and where focus is returned when the contact card is dismissed.
     * @param {IUnknown} contact Type: <b>IUnknown*</b>
     * 
     * A pointer to the contact object. Use a <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.contacts.contact">Windows.ApplicationModel.Contacts.Contact</a> object but cast to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> here because classic COM IDL can't use Windows Runtime types.
     * @param {Pointer<RECT>} selection Type: <b>RECT const*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/gdiplustypes/nl-gdiplustypes-rect">Rect</a> is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the <b>Rect</b> of the button so the contact card displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement Type: <b>FLYOUT_PLACEMENT</b>
     * 
     * A <b>FLYOUT_PLACEMENT</b>-typed value that describes the preferred placement of the contact card.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FP_DEFAULT"></a><a id="fp_default"></a><dl>
     * <dt><b>FP_DEFAULT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FP_ABOVE"></a><a id="fp_above"></a><dl>
     * <dt><b>FP_ABOVE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to place the contact card above the rectangular area of user selection specified by the <i>selection</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FP_BELOW"></a><a id="fp_below"></a><dl>
     * <dt><b>FP_BELOW</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to place the contact card below the rectangular area of user selection specified by the <i>selection</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FP_LEFT"></a><a id="fp_left"></a><dl>
     * <dt><b>FP_LEFT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to place the contact card to the left of the rectangular area of user selection specified by the <i>selection</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FP_RIGHT"></a><a id="fp_right"></a><dl>
     * <dt><b>FP_RIGHT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to place the contact card to the right of the rectangular area of user selection specified by the <i>selection</i> parameter. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * 
     * <a href="/previous-versions/dn302110(v=vs.85)">ShowContactCardForWindow</a> returns:
     *             
     *           
     * 
     * <ul>
     * <li>S_OK if the contact card is successfully displayed</li>
     * <li>E_POINTER if <i>appWindow</i> is NULL or <i>contact</i> is NULL or <i>selection</i> is NULL</li>
     * <li>E_INVALIDARG if <i>contact</i> isn't a <a href="/uwp/api/windows.applicationmodel.contacts.contact">Windows.ApplicationModel.Contacts.Contact</a> object or <i>preferredPlacement</i> is an invalid enumeration value</li>
     * </ul>
     * Other <a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a> values are possible.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icontactmanagerinterop-showcontactcardforwindow
     */
    ShowContactCardForWindow(appWindow, contact, selection, preferredPlacement) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", contact, "ptr", selection, "int", preferredPlacement, "HRESULT")
        return result
    }
}
