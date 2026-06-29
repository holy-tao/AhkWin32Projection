#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsOMImageResource.ahk" { IXpsOMImageResource }
#Import ".\XPS_THUMBNAIL_SIZE.ahk" { XPS_THUMBNAIL_SIZE }
#Import ".\IXpsOMPage.ahk" { IXpsOMPage }
#Import ".\XPS_IMAGE_TYPE.ahk" { XPS_IMAGE_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Generates a thumbnail image resource.
 * @remarks
 * To instantiate this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> as shown in the code example that follows.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMThumbnailGenerator    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *       __uuidof(XpsOMThumbnailGenerator),
 *       NULL, 
 *       CLSCTX_INPROC_SERVER,
 *       __uuidof(IXpsOMThumbnailGenerator),
 *       reinterpret_cast<LPVOID*>(&newInterface)
 *       );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     // use newInterface
 *     newInterface->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 *  
 * 
 * ```
 * 
 * 
 * This interface requires XpsRasterService.dll. 
 * If XpsRasterService.dll is not present when <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> is called to create an <b>IXpsOMThumbnailGenerator</b> instance, <b>CoCreateInstance</b> returns E_FAIL.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomthumbnailgenerator
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMThumbnailGenerator extends IUnknown {
    /**
     * The interface identifier for IXpsOMThumbnailGenerator
     * @type {Guid}
     */
    static IID := Guid("{15b873d5-1971-41e8-83a3-6578403064c7}")

    /**
     * The class identifier for XpsOMThumbnailGenerator
     * @type {Guid}
     */
    static CLSID := Guid("{7e4a23e2-b969-4761-be35-1a8ced58e323}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMThumbnailGenerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GenerateThumbnail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMThumbnailGenerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generates a thumbnail image of a page.
     * @param {IXpsOMPage} page A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompage">IXpsOMPage</a> interface that contains the page for which the thumbnail image will be created.
     * @param {XPS_IMAGE_TYPE} thumbnailType The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type">XPS_IMAGE_TYPE</a> value that specifies the type of thumbnail image to create.
     * @param {XPS_THUMBNAIL_SIZE} thumbnailSize The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_thumbnail_size">XPS_THUMBNAIL_SIZE</a> value that specifies the image size of the thumbnail to create.
     * @param {IOpcPartUri} imageResourcePartName A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> interface that contains the name of the new thumbnail image part.
     * @returns {IXpsOMImageResource} A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource">IXpsOMImageResource</a> interface that contains the thumbnail image created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomthumbnailgenerator-generatethumbnail
     */
    GenerateThumbnail(page, thumbnailType, thumbnailSize, imageResourcePartName) {
        result := ComCall(3, this, "ptr", page, XPS_IMAGE_TYPE, thumbnailType, XPS_THUMBNAIL_SIZE, thumbnailSize, "ptr", imageResourcePartName, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }

    Query(iid) {
        if (IXpsOMThumbnailGenerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GenerateThumbnail := CallbackCreate(GetMethod(implObj, "GenerateThumbnail"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GenerateThumbnail)
    }
}
