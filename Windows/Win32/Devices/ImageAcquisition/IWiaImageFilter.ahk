#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaImageFilter interface is an extension interface implemented by image processing filter developers and called by Windows Image Acquisition (WIA) 2.0.
 * @remarks
 * The **IWiaImageFilter** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaImageFilter** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * Image processing filter developers should implement this interface and the [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
 * 
 * WIA 2.0 calls filter methods. They are never called directly from an application.
 * 
 * Microsoft supplies the WIA 2.0 Preview Component, which caches the original, unfiltered preview image that is acquired from the scanner. An application uses [CoCreateInstance](/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance) to co-create an instance of the WIA 2.0 Preview Component (CLSID\_WiaPreview), which loads the filter using [**IWiaItem2::GetExtension**](-wia-iwiaitem2-getextension.md). The filter is called automatically when the application calls [**IWiaTransfer::Download**](-wia-iwiatransfer-download.md).
 * 
 * The image processing filter is always executed when an image is scanned. An application cannot acquire an image from the scanner without having the imaging filter applied first.
 * 
 * A filter must implement brightness and contrast at a minimum. The common UI, which provides brightness and contrast controls to the user, can display accurate previews to the user.
 * 
 * An image processing filter should never modify the *lMessage* member of the [**WiaTransferParams**](-wia-wiatransferparams.md) structure.
 * 
 * To read the required properties the image processing filter should call [**IWiaPropertyStorage::GetPropertyStream**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream) on the [**IWiaPropertyStorage**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage) interface that it gets from the item by calling [IWiaImageFilter::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)). The filter can then instantiate an [IPropertyStorage](/windows/win32/api/propidlbase/nn-propidlbase-ipropertystorage) instance on this stream to read the items properties. The image processing filter should not call [IWiaPropertyStorage::ReadMultiple](/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-readmultiple) directly because this method calls into the driver's `drvReadItemProperties`, but the WIA 2.0 service has already locked the driver in the `drvAcquireItemData` call so this call will timeout and fail.
 * 
 * The properties that the filter is interested in could for example be the brightness and contrast settings. The filter typically also needs to read the image format as well as the preview property, [**WIA\_DPS\_PREVIEW**](-wia-wiaitempropscannerdevice.md), from *pWiaItem2*. These properties are all used in the filtering process.
 * 
 * The WIA 2.0 components always writes unfiltered data into the image processing filter. The image processing algorithm implemented by the filter's stream can filter the data more than once and does not have to be concerned with producing the same results as filtering the data once.
 * 
 * The filter must pay attention to the [**WIA\_DPS\_PREVIEW**](-wia-wiaitempropscannerdevice.md) property, especially if some filter related tasks are handled in hardware. For example, a certain driver can change the brightness of the lamp in the scanner hardware depending on how the application has set the brightness into a WIA 2.0 item. During the final scan (when the application calls [**IWiaTransfer::Download**](-wia-iwiatransfer-download.md)) the driver would typically modify the physical lamp of the scanner. In this case the image processing filter may not have to perform any brightness processing at all. During a preview scan, however, the driver should not modify the brightness of the lamp—instead this should be taken care of solely in the image processing filter. It is important that the WIA 2.0 Preview Component and the image processing filter return accurate images based on the properties set into the item.
 * 
 * An image processing filter must support all image formats that the driver supports.
 * 
 * The image processing filter is always given an image corresponding to the selection area set into the item for which we are acquiring the image. Note, however, that the image may have been rotated by the driver in case it supports the [**WIA\_IPS\_ROTATION**](-wia-wiaitempropscanneritem.md) property.
 * 
 * The image processing filter is created through [**IWiaItem2::GetExtension**](-wia-iwiaitem2-getextension.md), typically not by the application but by WIA 2.0 components when an application calls [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md) or [**IWiaTransfer::Download**](-wia-iwiatransfer-download.md).
 * 
 * The **IWiaImageFilter** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaImageFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaImageFilter
     * @type {Guid}
     */
    static IID => Guid("{a8a79ffa-450b-41f1-8f87-849ccd94ebf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFilter", "SetNewCallback", "FilterPreviewImage", "ApplyProperties"]

    /**
     * Initializes the filter. Called by Windows Image Acquisition (WIA) 2.0 before each image download.
     * @remarks
     * This method is called when an application calls [**Download**](-wia-iwiatransfer-download.md) and when an application calls the WIA 2.0 Preview Component's `GetNewPreview` function. **IWiaImageFilter::InitializeFilter** stores the references to *pWiaItem2* and *pWiaTransferCallback* to pass into these functions. These two interface pointers should be stored as member variables and [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref) should be called for each. The interface pointers are also needed in the filter's implementation of [**TransferCallback**](-wia-iwiatransfercallback-transfercallback.md) and [**GetNextStream**](-wia-iwiatransfercallback-getnextstream.md) during image acquisition.
     * @param {IWiaItem2} pWiaItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * Specifies a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) item that represents the preview image.
     * @param {IWiaTransferCallback} pWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the application's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-initializefilter
     */
    InitializeFilter(pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Sets a new application callback for the image processing filter to use for forwarding calls.
     * @remarks
     * Do not call this method directly from your application.
     * 
     * The image processing filter is required to release the previously stored application callback interface before setting the new callback.
     * 
     * If *pWiaTransferCallback* is **NULL**, the image processing filter should simply release the old application callback and return S\_OK.
     * @param {IWiaTransferCallback} pWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)**
     * 
     * Specifies a pointer to the application's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-setnewcallback
     */
    SetNewCallback(pWiaTransferCallback) {
        result := ComCall(4, this, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Filters the preview image.
     * @remarks
     * Do not call this method directly from your application.
     * 
     * *pWiaChildItem2* must be a child item of the *pWiaItem2* that was passed into [**IWiaImageFilter::InitializeFilter**](-wia-iwiaimagefilter-initializefilter.md).
     * 
     * *InputImageExtents* is needed because the image processing filter is responsible for cutting out the image area that *pWiaChildItem2* represents from the image data passed in through *pInputStream*.
     * 
     * An application must ensure that *pWiaChildItem2* has the same image format (WIA\_IPA\_FORMAT), resolution (WIA\_IPS\_XRES and WIA\_IPS\_YRES) and bit depth (WIA\_IPA\_DEPTH) as *pWiaItem2* had when it was passed into [**GetNewPreview**](-wia-iwiapreview-getnewpreview.md).
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Not used. Set to 0.
     * @param {IWiaItem2} pWiaChildItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * The item that is processed.
     * @param {RECT} InputImageExtents Type: **RECT**
     * 
     * The coordinates (on the physical acquisition area) of the image that the preview component caches internally.
     * @param {IStream} pInputStream Type: **[IStream](/windows/win32/api/objidl/nn-objidl-istream)\***
     * 
     * A pointer to the [IStream](/windows/win32/api/objidl/nn-objidl-istream) interface for the cached image data that is filtered.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-filterpreviewimage
     */
    FilterPreviewImage(lFlags, pWiaChildItem2, InputImageExtents, pInputStream) {
        result := ComCall(5, this, "int", lFlags, "ptr", pWiaChildItem2, "ptr", InputImageExtents, "ptr", pInputStream, "HRESULT")
        return result
    }

    /**
     * Enables the image processing filter to write properties back to the driver (and device).
     * @remarks
     * Do not call this method directly from your application. It is called by Windows Image Acquisition (WIA) 2.0 after the image processing filter has processed the raw data.
     * 
     * *pWiaPropertyStorage* is the [**IWiaPropertyStorage**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage) interface into which the image processing filter should write properties. An image processing filter should use only the [IPropertyStorage::WriteMultiple](/windows/win32/api/propidlbase/nf-propidlbase-ipropertystorage-writemultiple) method to write properties.
     * 
     * This method allows the image processing filter to write properties back to the driver (and device). This may be necessary for filters that implement features such as auto-exposure during film scanning.
     * @param {IWiaPropertyStorage} pWiaPropertyStorage Type: **[**IWiaPropertyStorage**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage)\***
     * 
     * Specifies a pointer to the [**IWiaPropertyStorage**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiapropertystorage) for the properties to be applied.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaimagefilter-applyproperties
     */
    ApplyProperties(pWiaPropertyStorage) {
        result := ComCall(6, this, "ptr", pWiaPropertyStorage, "HRESULT")
        return result
    }
}
