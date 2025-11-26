#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireOptionsDialog interface is used to display an options dialog box in which the user can select photo acquisition settings such as file name formats, as well as whether or not to rotate images, to prompt for a tag name, or to erase photos from the camera after importing.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquireoptionsdialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireOptionsDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static IID => Guid("{00f2b3ee-bf64-47ee-89f4-4dedd79643f2}")

    /**
     * The class identifier for PhotoAcquireOptionsDialog
     * @type {Guid}
     */
    static CLSID => Guid("{00f210a1-62f0-438b-9f7e-9618d72a1831}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Create", "Destroy", "DoModal", "SaveData"]

    /**
     * Initializes the options dialog box and reads any saved options from the registry.
     * @param {PWSTR} pszRegistryRoot (optional) Pointer to a null-terminated string containing the registry root of a custom location to read the acquisition settings from. If this parameter is set to <b>NULL</b>, the default location will be used.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-initialize
     */
    Initialize(pszRegistryRoot) {
        pszRegistryRoot := pszRegistryRoot is String ? StrPtr(pszRegistryRoot) : pszRegistryRoot

        result := ComCall(3, this, "ptr", pszRegistryRoot, "HRESULT")
        return result
    }

    /**
     * The Create method creates and displays a modeless instance of the photo options dialog box, hosted within a parent window.
     * @param {HWND} hWndParent Handle to the parent window.
     * @returns {HWND} Specifies the created dialog box.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-create
     */
    Create(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        phWndDialog := HWND()
        result := ComCall(4, this, "ptr", hWndParent, "ptr", phWndDialog, "HRESULT")
        return phWndDialog
    }

    /**
     * The Destroy method closes and destroys the modeless dialog box created with the Create method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The DoModal method creates and displays the options dialog box as a modal dialog box.
     * @param {HWND} hWndParent Handle to the dialog's parent window.
     * @param {Pointer<Pointer>} ppnReturnCode Specifies the code returned when the window is closed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-domodal
     */
    DoModal(hWndParent, ppnReturnCode) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        ppnReturnCodeMarshal := ppnReturnCode is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", hWndParent, ppnReturnCodeMarshal, ppnReturnCode, "HRESULT")
        return result
    }

    /**
     * The SaveData method saves acquisition settings from the options dialog box to the registry so that a subsequent instance of the dialog can be initialized with the same settings.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquireoptionsdialog-savedata
     */
    SaveData() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
