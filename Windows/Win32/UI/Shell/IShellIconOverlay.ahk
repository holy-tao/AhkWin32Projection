#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are used by a namespace extension to specify icon overlays for the objects it contains.
 * @remarks
 * 
  * Icon overlays are small images placed at the lower-left corner of the icon that represents a Shell object. They are typically used to add some extra information to the icon. A commonly used icon overlay is the small arrow that indicates that a file or folder icon represents a shortcut.
  * 
  * Icon overlays are part of the system image list. They have two identifiers. One is a one-based overlay index that identifies the overlay relative to other overlays in the image list. The other is an image index that identifies the actual image. These two indexes are equivalent to the values that you assign to the <i>iOverlay</i> and <i>iImage</i> parameters, respectively, when you add an icon overlay to a private image list with <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_setoverlayimage">ImageList::SetOverlayImage</a>.
  * 
  * Before displaying the icon for an object, the Shell calls the associated folder's <b>IShellIconOverlay</b> interface to query whether the object's icon should have an overlay. Typically it calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayindex">IShellIconOverlay::GetOverlayIndex</a> to request the overlay's overlay index. In some cases, the Shell might call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayiconindex">IShellIconOverlay::GetOverlayIconIndex</a> to request the overlay's image index. To specify an icon overlay, the methods must return the requested index. Otherwise, they return S_FALSE.
  * 
  * To specify an icon overlay, both methods must first retrieve the overlay's overlay index in the system image list by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgeticonoverlayindexa">SHGetIconOverlayIndex</a>. When <b>SHGetIconOverlayIndex</b> is called for the first time, the Shell uses the overlay's file name and index within the file to add the image to the system image list. Once an overlay is in the system image list, the Shell simply uses the file name and index as an identifier. You can also use <b>SHGetIconOverlayIndex</b> to retrieve the overlay index of several standard system overlays. <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayindex">IShellIconOverlay::GetOverlayIndex</a> simply returns the overlay index to the Shell. <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayiconindex">IShellIconOverlay::GetOverlayIconIndex</a> must use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to convert the overlay index to the equivalent image index.
  * 
  *  The number of different icon overlay handlers that the system can support is limited by the amount of space available for icon overlays in the system image list. There are currently fifteen slots allotted for icon overlays, some of which are reserved by the system. For this reason, icon overlays should be specified only if there are no satisfactory alternatives.
  * 
  * This interface is implemented by namespace extensions that need to specify icon overlays for their objects.
  * 
  * This interface is not typically used by applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishelliconoverlay
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellIconOverlay extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellIconOverlay
     * @type {Guid}
     */
    static IID => Guid("{7d688a70-c613-11d0-999b-00c04fd655e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOverlayIndex", "GetOverlayIconIndex"]

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayindex
     */
    GetOverlayIndex(pidl, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pidl, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} pIconIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishelliconoverlay-getoverlayiconindex
     */
    GetOverlayIconIndex(pidl, pIconIndex) {
        pIconIndexMarshal := pIconIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pidl, pIconIndexMarshal, pIconIndex, "HRESULT")
        return result
    }
}
