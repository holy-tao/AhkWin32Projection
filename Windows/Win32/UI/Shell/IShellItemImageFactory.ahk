#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to return either icons or thumbnails for Shell items. If no thumbnail or icon is available for the requested item, a per-class icon may be provided from the Shell.
 * @remarks
 * 
 * A pointer to this interface is commonly obtained through one of the following functions:
 *                 
 *                 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a>
 * </li>
 * </ul>
 * See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940383(v=vs.85)">Using Image Factory</a> sample for a full example of how to use this interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitemimagefactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItemImageFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItemImageFactory
     * @type {Guid}
     */
    static IID => Guid("{bcc18b79-ba16-442f-80c4-8a59c30c463b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImage"]

    /**
     * Gets an HBITMAP that represents an IShellItem.
     * @param {SIZE} size Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a></b>
     * 
     * A structure that specifies the size of the image to be received.
     * @param {Integer} flags Type: <b>SIIGBF</b>
     * 
     * One or more of the following:
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the handle of the retrieved bitmap. It is the responsibility of the caller to free this retrieved resource through <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemimagefactory-getimage
     */
    GetImage(size, flags) {
        phbm := HBITMAP()
        result := ComCall(3, this, "ptr", size, "int", flags, "ptr", phbm, "HRESULT")
        return phbm
    }
}
