#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that hosts an IFolderView object in a window.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifolderviewhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderViewHost
     * @type {Guid}
     */
    static IID => Guid("{1ea58f02-d55a-411d-b09e-9e65ac21605b}")

    /**
     * The class identifier for FolderViewHost
     * @type {Guid}
     */
    static CLSID => Guid("{20b1cb23-6968-4eb9-b7d4-a66d00d07cee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes the object that hosts an IFolderView object.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * The handle of the window that contains the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ifolderviewhost">IFolderViewHost</a> object.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * The address of a pointer to a data object.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The address of a pointer to a <b>RECT</b> structure that specifies the dimensions of the folder view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ifolderviewhost-initialize
     */
    Initialize(hwndParent, pdo, prc) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pdo, "ptr", prc, "HRESULT")
        return result
    }
}
