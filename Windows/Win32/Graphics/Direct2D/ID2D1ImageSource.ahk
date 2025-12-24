#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Image.ahk

/**
 * Represents a producer of pixels that can fill an arbitrary 2D plane.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1imagesource
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ImageSource extends ID2D1Image{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ImageSource
     * @type {Guid}
     */
    static IID => Guid("{c9b664e5-74a1-4378-9ac2-eefc37a3f4d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OfferResources", "TryReclaimResources"]

    /**
     * Allows the operating system to free the video memory of resources by discarding their content.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <b>OfferResources</b> returns:
     *             
     * 
     * <ul>
     * <li><b>S_OK</b> if resources were successfully offered
     *               </li>
     * <li><b>E_INVALIDARG</b> if a resource in the array or the priority is invalid
     *               </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1imagesource-offerresources
     */
    OfferResources() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Restores access to resources that were previously offered by calling OfferResources.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Returns with TRUE if the corresponding resource’s content was discarded and is now undefined, or FALSE if the corresponding resource’s old content is still intact.
     *             The caller can pass in NULL, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1imagesource-tryreclaimresources
     */
    TryReclaimResources() {
        result := ComCall(5, this, "int*", &resourcesDiscarded := 0, "HRESULT")
        return resourcesDiscarded
    }
}
