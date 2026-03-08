#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaTransferCallback interface receives callbacks during a data transfer.
 * @remarks
 * The **IWiaTransferCallback** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaTransferCallback** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * Image processing filter developers should implement this interface and the [**IWiaImageFilter**](-wia-iwiaimagefilter.md) interface.
 * 
 * The **IWiaTransferCallback** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransferCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaTransferCallback
     * @type {Guid}
     */
    static IID => Guid("{27d4eaaf-28a6-4ca5-9aab-e678168b9527}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferCallback", "GetNextStream"]

    /**
     * Provides progress and other notifications during a transfer.
     * @remarks
     * When this method is implemented by an image processing filter, the Windows Image Acquisition (WIA) 2.0 minidriver calls it during image acquisition to send progress messages back to the application.
     * 
     * A filter's **IWiaTransferCallback::TransferCallback** must delegate to the application callback's **IWiaTransferCallback::TransferCallback** method. Usually, the filter stream filters the data passed to it and writes the filtered data directly to the application provided stream. When image processing filter stores data between calls to its [IStream::Write](/windows/win32/api/objidl/nf-objidl-isequentialstream-write) method, it must also modify the *lPercentComplete* and *ulBytesWrittenToCurrentStream* values in the [**WiaTransferParams**](-wia-wiatransferparams.md) structure.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {Pointer<WiaTransferParams>} pWiaTransferParams Type: **[**WiaTransferParams**](-wia-wiatransferparams.md)\***
     * 
     * Specifies a pointer to a [**WiaTransferParams**](-wia-wiatransferparams.md) structure.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback-transfercallback
     */
    TransferCallback(lFlags, pWiaTransferParams) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaTransferParams, "HRESULT")
        return result
    }

    /**
     * Gets a new stream for the specified item.
     * @remarks
     * When this method is implemented by an image processing filter, the Windows Image Acquisition (WIA) 2.0 minidriver calls it during image acquisition to get the destination stream from the client.
     * 
     * A filter's **IWiaTransferCallback::GetNextStream** must delegate to the application's callback method. The filter uses the stream returned by the application callback's **IWiaTransferCallback::GetNextStream** implementation to create its own stream that it passes back to the WIA 2.0 service. The filtering is done when the filter's stream calls the [IStream::Write](/windows/win32/api/objidl/nf-objidl-isequentialstream-write) method.
     * 
     * The filter's stream cannot make any assumptions on the number of bytes that are written to it on each write, since the unfiltered image data may come from the WIA 2.0 Preview Component rather than the driver. The WIA 2.0 Preview Component always writes the whole unfiltered image data into the filter's stream only once, which means that the filter's stream has one source writing into it. If both the driver and the preview component write into the filter's stream, the filter's stream cannot assume, for example, that it will receive the full header the first time [IStream::Write](/windows/win32/api/objidl/nf-objidl-isequentialstream-write) is called although its corresponding driver always writes the header data first in one write. Nor can it assume that a subsequent write contains exactly one scan line. So the filtering stream may have to count the number of bytes written to it to determine, for example, where the image data starts.
     * 
     * The image processing filter's **IWiaTransferCallback::GetNextStream** implementation should read the properties needed for its image processing from the item for which the image is being acquired. The filter does not read the properties directly from the *pWiaItem2* passed into [**InitializeFilter**](-wia-iwiaimagefilter-initializefilter.md). Instead the filter must call [**FindItemByName**](-wia-iwiaitem2-finditembyname.md) on this WIA 2.0 item to obtain the actual WIA 2.0 item. The reason for this is that the image being acquired may actually be a child item of *pWiaItem2*. For example, during a folder acquisition the filter uses *pWiaItem2* to obtain *pWiaItem2*'s child items in **IWiaTransferCallback::GetNextStream** (during a folder acquisition the driver returns the images represented by the child items of *pWiaItem2*). The same is true when the WIA 2.0 Preview Component calls into the image processing filter passing a child WIA 2.0 item.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrItemName Type: **BSTR**
     * 
     * Specifies the name of the item to create stream for.
     * @param {BSTR} bstrFullItemName Type: **BSTR**
     * 
     * Specifies the full name of the item to create stream for.
     * @returns {IStream} Type: **[IStream](/windows/win32/api/objidl/nn-objidl-istream)\*\***
     * 
     * Receives the address of a pointer to the new [IStream](/windows/win32/api/objidl/nn-objidl-istream) object.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback-getnextstream
     */
    GetNextStream(lFlags, bstrItemName, bstrFullItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(4, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", &ppDestination := 0, "HRESULT")
        return IStream(ppDestination)
    }
}
