#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMResource.ahk" { IXpsOMResource }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XPS_IMAGE_TYPE.ahk" { XPS_IMAGE_TYPE }

/**
 * Provides an IStream interface to an image resource.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMImageResource    *newInterface;
 * // The following values are defined outside of 
 * // this example.
 * //  IStream            *acquiredStream;
 * //  XPS_IMAGE_TYPE     contentType;
 * //  IOpcPartUri        *partUri;
 *     
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     // The partUriString and acquiredStream variables 
 *     //   are defined outside of this example.
 *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
 *     if (SUCCEEDED(hr))
 *     {
 *         hr = xpsFactory->CreateImageResource (
 *             acquiredStream,
 *             contentType,
 *             partUri,
 *             &newInterface);
 *         if (SUCCEEDED(hr))
 *         {
 *             // use newInterface
 * 
 *             newInterface->Release();
 *         }
 *         partUri->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresource
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMImageResource extends IXpsOMResource {
    /**
     * The interface identifier for IXpsOMImageResource
     * @type {Guid}
     */
    static IID := Guid("{3db8417d-ae50-485e-9a44-d7758f78a23f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMImageResource interfaces
    */
    struct Vtbl extends IXpsOMResource.Vtbl {
        GetStream    : IntPtr
        SetContent   : IntPtr
        GetImageType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMImageResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource. (IXpsOMImageResource.GetStream)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this method might return an error of E_PENDING, which indicates that the stream length has not been determined yet.  This behavior is different from that of a standard <b>IStream</b> object.
     * 
     * This method calls the stream's <b>Clone</b> method to create the stream returned in <i>stream</i>. As a result, the performance of this method will depend on that of the stream's <b>Clone</b> method.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &readerStream := 0, "HRESULT")
        return IStream(readerStream)
    }

    /**
     * Sets the read-only stream to be associated with this resource. (IXpsOMImageResource.SetContent)
     * @remarks
     * The calling method  should treat this stream as a single-threaded apartment (STA) model object and not re-enter any of the stream interface's methods.
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-getstream">GetStream</a> gets a clone of  the stream that is set by this method, the provided stream should have an efficient cloning method. A stream with an inefficient cloning method will reduce the performance of <b>GetStream</b>.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {XPS_IMAGE_TYPE} _imageType The  <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type">XPS_IMAGE_TYPE</a> value that describes the type of image in the stream.
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-setcontent
     */
    SetContent(sourceStream, _imageType, partName) {
        result := ComCall(6, this, "ptr", sourceStream, XPS_IMAGE_TYPE, _imageType, "ptr", partName, "HRESULT")
        return result
    }

    /**
     * Gets the type of image resource.
     * @returns {XPS_IMAGE_TYPE} The  <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_image_type">XPS_IMAGE_TYPE</a> value that describes the image type in the stream.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresource-getimagetype
     */
    GetImageType() {
        result := ComCall(7, this, "int*", &_imageType := 0, "HRESULT")
        return _imageType
    }

    Query(iid) {
        if (IXpsOMImageResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.SetContent := CallbackCreate(GetMethod(implObj, "SetContent"), flags, 4)
        this.vtbl.GetImageType := CallbackCreate(GetMethod(implObj, "GetImageType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.SetContent)
        CallbackFree(this.vtbl.GetImageType)
    }
}
