#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaPreview interface caches unfiltered images internally and passes them through image processing filters.
 * @remarks
 * The **IWiaPreview** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaPreview** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * This filter is called automatically by the [**IWiaTransfer::Download**](-wia-iwiatransfer-download.md) method.
 * 
 * The **IWiaPreview** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaPreview extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaPreview
     * @type {Guid}
     */
    static IID => Guid("{95c2b4fd-33f2-4d86-ad40-9431f0df08f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNewPreview", "UpdatePreview", "DetectRegions", "Clear"]

    /**
     * Caches internally the unfiltered image returned from the driver.
     * @remarks
     * An application must call **IWiaPreview::GetNewPreview** before it calls [**IWiaPreview::DetectRegions**](-wia-iwiapreview-detectregions.md).
     * 
     * **IWiaPreview::GetNewPreview** sets the [**WIA\_DPS\_PREVIEW**](-wia-wiaitempropscannerdevice.md) property (and resets it before it returns, unless it was set before). This lets the driver and hardware, as well as the image processing filter, know that the item is a preview scan.
     * 
     * Internally, the Windows Image Acquisition (WIA) 2.0 preview component creates an instance of the driver's image processing filter by calling [**GetExtension**](-wia-iwiaitem2-getextension.md) on *pWiaItem2*. The WIA 2.0 preview component does this when the application calls **IWiaPreview::GetNewPreview**. The WIA 2.0 preview component also initializes the filter in **IWiaPreview::GetNewPreview**. The same filter instance is used by the WIA 2.0 preview component during a call to [**IWiaPreview::UpdatePreview**](-wia-iwiapreview-updatepreview.md).
     * 
     * Before calling into the WIA 2.0 preview component, an application should call [**CheckExtension**](-wia-iwiaitem2-checkextension.md) to make sure that the driver comes with an image processing filter. It should call **CheckExtension** on the item that it would pass to **IWiaPreview::GetNewPreview**. It is useless to provide live previews without an image processing filter. If an application calls **IWiaPreview::GetNewPreview** for a driver without an image processing filter, the call will fail.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IWiaItem2} pWiaItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * Specifies a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) item for the image.
     * @param {IWiaTransferCallback} pWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the calling application's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-getnewpreview
     */
    GetNewPreview(lFlags, pWiaItem2, pWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Gets the unfiltered image cached by the IWiaPreview::GetNewPreview method.
     * @remarks
     * This method passes the cached, unfiltered image through the image processing filter, which then writes the filtered data to the application-provided stream. The WIA 2.0 Preview Component retrieves this stream by calling the image processing filter's [**GetNextStream**](-wia-iwiatransfercallback-getnextstream.md) method, which then calls the application callback's **GetNextStream** implementation. Before calling **IWiaPreview::UpdatePreview**, an application must first call [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md) to acquire the image from the scanner; otherwise, the method returns an error.
     * 
     * The WIA 2.0 Preview Component stores the unfiltered image downloaded from the driver. It is possible that the WIA 2.0 item passed into **IWiaPreview::UpdatePreview** represents only a small region of the image downloaded from the driver. If this is the case the WIA 2.0 Preview Component actually cuts out this region from the cached image before it passes it to the image processing filter, which in turn passes the filtered image data back to the application.
     * 
     * For an application to pass the entire cached image to the image processing filter (which in turn passes it to the application), it must set the *lOptions* to **WiaPreviewReturnOriginalImage** when calling **IWiaPreview::UpdatePreview**. When setting *lOptions* to **WiaPreviewReturnOriginalImage**, the application must ensure that the extent settings ([**WIA\_IPS\_XEXTENT**](-wia-wiaitempropscanneritem.md) and **WIA\_IPS\_YEXTENT**) of the item passed into **IWiaPreview::UpdatePreview** matches the full-cached image. The image processing filter need not do anything different in this case; it simply filters the image, based on the properties of *pChildWiaItem* (typically in this case *pChildWiaItem* is the same item that was passed to [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md)). The different sub-regions are ignored and the whole image is filtered using the same settings. There are a couple of reasons why an application would do this.
     * 
     * 1.  The application may not support changing the settings (like [**WIA\_IPS\_BRIGHTNESS**](-wia-wiaitempropscanneritem.md) and **WIA\_IPS\_CONTRAST**) individually for each region that the segmentation filter detects (or it may not even want to use the segmentation filter). It is easier for the application to call **IWiaPreview::UpdatePreview** with **WiaPreviewReturnOriginalImage** so that it always receives the full image from the WIA 2.0 Preview Component.
     * 2.  The WIA 2.0 Preview Component does not support the image format of the preview image, in which case it cannot perform the actions to cut out the desired region. The WIA 2.0 Preview Component's image format support is limited to formats for which there are Windows GDI+ 1.1 encoders and decoders. These formats are bitmap (BMP) (a bitmap that includes the BITMAPFILEHEADER), Graphics Interchange Format (GIF), JPEG, Portable Network Graphics (PNG), and Tagged Image File Format (TIFF).
     * 
     * Note that if the application passes **WiaPreviewReturnOriginalImage** into **IWiaPreview::UpdatePreview**, the WIA 2.0 Preview Component can support any image or pixel format.
     * 
     * **IWiaPreview::UpdatePreview** sets the [**WIA\_DPS\_PREVIEW**](-wia-wiaitempropscannerdevice.md) property (and resets it before it returns, unless it was set before). This lets the driver (and hardware) as well as the image processing filter, know that the item is a preview scan.
     * 
     * An application must ensure that *pChildWiaItem* has the same image format ([**WIA\_IPA\_FORMAT**](-wia-wiaitempropcommonitem.md)) and resolution ([**WIA\_IPS\_XRES**](-wia-wiaitempropscanneritem.md) and **WIA\_IPS\_YRES**) as *pWiaItem* had when it was passed into [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md). The format of the child item must correspond to the format of the WIA 2.0 Preview Component's cached image (the WIA 2.0 Preview Component performs no image conversion).
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pChildWiaItem2 
     * @param {IWiaTransferCallback} pWiaTransferCallback 
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-updatepreview
     */
    UpdatePreview(lFlags, pChildWiaItem2, pWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pChildWiaItem2, "ptr", pWiaTransferCallback, "HRESULT")
        return result
    }

    /**
     * Invokes the driver segmentation filter and passes the unfiltered image cached by the IWiaPreview::GetNewPreview method to the filter.
     * @remarks
     * An application must call [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md) before it calls this function.
     * 
     * When the Windows Image Acquisition (WIA) 2.0 Preview Component calls **IWiaPreview::DetectRegions**, it invokes the driver segmentation filter and passes the [**IWiaItem2**](-wia-iwiaitem2.md) interface that was previously passed to [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md). It also passes the internally cached image to the filter. The segmentation filter uses the cached image to create the child extents.
     * 
     * If an application changes any properties of the [**IWiaItem2**](-wia-iwiaitem2.md) interface after it calls [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md), then the original properties must be restored before the application calls **IWiaPreview::DetectRegions**. Use [**GetPropertyStream**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream) and [**SetPropertyStream**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-setpropertystream) to restore the original properties.
     * 
     * **IWiaPreview::DetectRegions** is used to determine the "sub-regions" of the cached image. For each sub-region detected, a new child WIA 2.0 item is created under the [**IWiaItem2**](-wia-iwiaitem2.md) interface. For each child item, the segmentation filter must set the values for the following WIA 2.0 properties: WIA\_IPS\_XPOS, WIA\_IPS\_YPOS, WIA\_IPS\_XEXTENT, and WIA\_IPS\_YEXTENT. A more advanced filter sets other WIA 2.0 properties, such as WIA\_IPS\_DESKEW\_X and WIA\_IPS\_DESKEW\_Y, if the driver supports de-skewing. The WIA\_IPS\_XPOS, WIA\_IPS\_YPOS, WIA\_IPS\_XEXTENT, and WIA\_IPS\_YEXTENT properties represent the bounding rectangle of the area to scan.
     * 
     * The driver might not support segmentation. Before calling **IWiaPreview::DetectRegions**, an application typically checks whether the driver supports the WIA\_IPS\_SEGMENTATION property. If the property is not implemented, segmentation is not supported, and **IWiaPreview::DetectRegions** fails and returns E\_NOTIMPL.
     * 
     * The application must clean up the child items that are created by calling **IWiaPreview::DetectRegions**. For example, if an application makes an additional call to **IWiaPreview::DetectRegions** on the same item, it must clean up the previous child items.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Not used. Set to zero (0).
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                               | Description                                          |
     * |-------------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>      | The operation is successful.<br/>              |
     * | <dl> <dt>**E\_NOTIMPL**</dt> </dl> | The driver does not support segmentation.<br/> |
     * | <dl> <dt>**otherwise**</dt> </dl>  | A standard COM error code.<br/>                |
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-detectregions
     */
    DetectRegions(lFlags) {
        result := ComCall(5, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Releases the unfiltered image cached by the IWiaPreview::GetNewPreview method. It also releases the image processing filter.
     * @remarks
     * On **IWiaPreview::Clear** the Windows Image Acquisition (WIA) 2.0 Preview Component releases all interface pointers that it stores. The WIA 2.0 Preview Component keeps references to *pWiaItem2* and *pWiaTransferCallback* passed into [**IWiaPreview::GetNewPreview**](-wia-iwiapreview-getnewpreview.md). To be precise, the WIA 2.0 Preview Component keeps a reference to *pWiaItem2* and the driver's image processing filter, which in turn keeps a reference to *pWiaTransferCallback*. On **IWiaPreview::Clear**, the WIA 2.0 Preview Component also releases its reference to *pWiaItem2* and to the image processing filter, which in turn releases its reference to *pWiaTransferCallback*. The WIA 2.0 Preview Component deletes the cached, unfiltered image that it stores internally.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiapreview-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
