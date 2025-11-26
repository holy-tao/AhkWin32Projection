#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that request a thumbnail image from a Shell folder.
 * @remarks
 * 
 * There are two steps in the process: First, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iextractimage-getlocation">GetLocation</a> to request the path description of an image and specify how the image should be rendered. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iextractimage-extract">Extract</a> to extract the image.
 * 
 * If the object is free-threaded it must also expose an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a> interface so it can be stopped and started as needed. This feature can be particularly useful when extraction may be slow.
 * 
 * Implement <b>IExtractImage</b> if your namespace extension needs to provide thumbnail images to be displayed in a Shellview.
 * 
 * Use <b>IExtractImage</b> if you are implementing a view of namespace objects, and want to display thumbnail images. You can use a Shell folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method to bind to its <b>IExtractImage</b> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iextractimage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExtractImage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtractImage
     * @type {Guid}
     */
    static IID => Guid("{bb2e617c-0920-11d1-9a0b-00c04fc2d6c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocation", "Extract"]

    /**
     * Gets a path to the image that is to be extracted.
     * @param {PWSTR} pszPathBuffer Type: <b>LPWSTR</b>
     * 
     * The buffer used to return the path description. This value identifies the image so you can avoid loading the same one more than once.
     * @param {Integer} cch Type: <b>DWORD</b>
     * 
     * The size of <i>pszPathBuffer</i> in characters.
     * @param {Pointer<Integer>} pdwPriority Type: <b>DWORD*</b>
     * 
     * Not used.
     * 
     * <b>Microsoft Windows XP and earlier:</b> The pointer used to return the priority of the item when the <b>IEIFLAG_ASYNC</b> flag is set in <i>pdwFlags</i>. This parameter must not be <b>NULL</b>.  The function fails if this parameter is <b>NULL</b>, whether  <b>IEIFLAG_ASYNC</b> flag is set or not. 
     * 
     * This parameter is typically used to indicate the amount of time needed to extract the image. If you want more control over the order in which thumbnails are extracted, you can define multiple priority levels, up to 32 bits. As long as the integer values assigned to the different priority levels increase from low to high priority, the actual numbers you use aren't important. They are only used to determine the order in which the images will be extracted. There are three standard priority levels:
     * @param {Pointer<SIZE>} prgSize Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure with the desired width and height of the image. Must not be <b>NULL</b>.
     * @param {Integer} dwRecClrDepth Type: <b>DWORD</b>
     * 
     * The recommended color depth in units of bits per pixel. Must not be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * Flags that specify how the image is to be handled. Value must be one or more of the following:
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method may return a COM-defined error code or one of the following:
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
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows XP and earlier:</b> If the <b>IEIFLAG_ASYNC</b> flag is set, this return value is used to indicate to the Shell that the object is free-threaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iextractimage-getlocation
     */
    GetLocation(pszPathBuffer, cch, pdwPriority, prgSize, dwRecClrDepth, pdwFlags) {
        pszPathBuffer := pszPathBuffer is String ? StrPtr(pszPathBuffer) : pszPathBuffer

        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszPathBuffer, "uint", cch, pdwPriorityMarshal, pdwPriority, "ptr", prgSize, "uint", dwRecClrDepth, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Requests an image from an object, such as an item in a Shell folder.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * The buffer to hold the bitmapped image.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iextractimage-extract
     */
    Extract() {
        phBmpThumbnail := HBITMAP()
        result := ComCall(4, this, "ptr", phBmpThumbnail, "HRESULT")
        return phBmpThumbnail
    }
}
