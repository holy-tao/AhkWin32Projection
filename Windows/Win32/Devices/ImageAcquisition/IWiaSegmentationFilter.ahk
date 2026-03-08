#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaSegmentationFilter interface detects sub-regions of an image stream and makes separate IWiaItem2 items for each.
 * @remarks
 * The **IWiaSegmentationFilter** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaSegmentationFilter** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * An application should use [**IWiaItem2::GetExtension**](-wia-iwiaitem2-getextension.md) to create a new instance of the segmentation filter. An application typically calls this function before displaying its preview window.
 * 
 * When implementing this filter, use [**IWiaItem2::CreateChildItem**](-wia-iwiaitem2-createchilditem.md) to create the child items. The application should pass **COPY\_PARENT\_PROPERTY\_VALUES** to the *ICreationFlags* parameter to ensure that properties such as image format and resolution is the same in the newly created child as in the parent item.
 * 
 * A segmentation filter must support all the image formats that the driver it is used with supports. The Microsoft provided filter supports bitmap (BMP), Graphics Interchange Format (GIF), JPEG, Portable Network Graphics (PNG), and Tagged Image File Format (TIFF).
 * 
 * The segmentation filter should be used only on film and flatbed scanner items. For film scanning, a scanner often comes with fixed frames in which case the driver created the child items and the application should not invoke the segmentation filter.
 * 
 * The **IWiaSegmentationFilter** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiasegmentationfilter
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaSegmentationFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaSegmentationFilter
     * @type {Guid}
     */
    static IID => Guid("{ec46a697-ac04-4447-8f65-ff63d5154b21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetectRegions"]

    /**
     * Determines the sub-regions of an image laid out on the flatbed platen so that each of sub-region can be acquired into a separate image item.
     * @remarks
     * This method determines the sub-regions of the image represented by pInputStream. For each sub-region that it detects, it creates a child item for the [**IWiaItem2**](-wia-iwiaitem2.md) item specified in the *pWiaItem2* parameter. For each child item, the segmentation filter must set values for the bounding rectangle of the area to scan, using the following [**Scanner WIA Item Property Constants**](-wia-wiaitempropscanneritem.md).
     * 
     * -   [**WIA\_IPS\_XPOS**](-wia-wiaitempropscanneritem.md)
     * -   [**WIA\_IPS\_YPOS**](-wia-wiaitempropscanneritem.md)
     * -   [**WIA\_IPS\_XEXTENT**](-wia-wiaitempropscanneritem.md)
     * -   [**WIA\_IPS\_YEXTENT**](-wia-wiaitempropscanneritem.md)
     * 
     * A more advanced filter may also require other [**Scanner WIA Item Property Constants**](-wia-wiaitempropscanneritem.md) such as **WIA\_IPS\_DESKEW\_X** and **WIA\_IPS\_DESKEW\_Y**, if the driver supports de-skewing.
     * 
     * If the application calls **IWiaSegmentationFilter::DetectRegions** more than once, the application must first delete the child items created by the last call to **IWiaSegmentationFilter::DetectRegions**.
     * 
     * If an application changes any properties into *pWiaItem2*, between acquiring the image into *pInputStream* and its call to **IWiaSegmentationFilter::DetectRegions**, the original properties (that is, the properties the item had when the stream was acquired) must be restored. This can be done by [**GetPropertyStream**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-getpropertystream) and [**SetPropertyStream**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiapropertystorage-setpropertystream).
     * 
     * The application must reset the [IStream](/windows/win32/api/objidl/nn-objidl-istream) if its call passes the same stream into the segmentation filter more than once. The application must also reset the stream after the initial download and before calling **IWiaSegmentationFilter::DetectRegions**.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IStream} pInputStream Type: **[IStream](/windows/win32/api/objidl/nn-objidl-istream)\***
     * 
     * Specifies a pointer to the [IStream](/windows/win32/api/objidl/nn-objidl-istream) preview image.
     * @param {IWiaItem2} pWiaItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * Specifies a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) item for which *pInputStream* was acquired. The segmentation filter creates child items for this item.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiasegmentationfilter-detectregions
     */
    DetectRegions(lFlags, pInputStream, pWiaItem2) {
        result := ComCall(3, this, "int", lFlags, "ptr", pInputStream, "ptr", pWiaItem2, "HRESULT")
        return result
    }
}
