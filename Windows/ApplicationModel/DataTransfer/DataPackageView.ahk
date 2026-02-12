#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataPackageView.ahk
#Include .\IDataPackageView2.ahk
#Include .\IDataPackageView3.ahk
#Include .\IDataPackageView4.ahk
#Include ..\..\..\Guid.ahk

/**
 * A read-only version of a [DataPackage](datapackage.md). Apps that receive shared content get this object when acquiring content.
 * @remarks
 * During a share operation, the source app puts the data being shared in a **DataPackage** object and sends that object to the target app for processing. The **DataPackage** class includes a number of methods to support the following default formats: [text](standarddataformats_text.md), [Rtf](standarddataformats_rtf.md), [Html](standarddataformats_html.md), [Bitmap](standarddataformats_bitmap.md), and [StorageItems](standarddataformats_storageitems.md). It also has methods to support custom data formats. To use these formats, both the source app and target app must already be aware that the custom format exists.
 * 
 * Target apps can use the DataPackageView object to acquire the data being shared. In addition, these apps can use the [AvailableFormats](datapackageview_availableformats.md) property to identify what formats the DataPackageView supports, or the [Contains](datapackageview_contains_1741733936.md) method to query for a specific format.
 * 
 * Source apps have the option of using the [SetDataProvider](datapackage_setdataprovider_375548563.md) to assign a delegate to a **DataPackage**, instead of providing the data immediately. This process is useful in situations where the source app supports a given format but does not want to generate the data unless the target app requests it. For example, a source app might support a variety of image formats for sharing photos. Instead of creating multiple copies of each image using these formats, the source app can use a delegate that is called when the target app requests a specific format type.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataPackageView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPackageView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPackageView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [DataPackagePropertySetView](datapackagepropertysetview.md) object, which contains a read-only set of properties for the data in the [DataPackageView](datapackageview.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.properties
     * @type {DataPackagePropertySetView} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the requested operation (such as copy or move). Primarily used for Clipboard actions.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.requestedoperation
     * @type {Integer} 
     */
    RequestedOperation {
        get => this.get_RequestedOperation()
    }

    /**
     * Returns the formats the [DataPackageView](datapackageview.md) contains.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.availableformats
     * @type {IVectorView<HSTRING>} 
     */
    AvailableFormats {
        get => this.get_AvailableFormats()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackagePropertySetView} 
     */
    get_Properties() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedOperation() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.get_RequestedOperation()
    }

    /**
     * Informs the system that your app is finished using the [DataPackageView](datapackageview.md) object. Primarily used for Clipboard operations.
     * @param {Integer} value An enumeration that states what operation (such as copy or move) was completed. At most one operation flag can be set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.reportoperationcompleted
     */
    ReportOperationCompleted(value) {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.ReportOperationCompleted(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AvailableFormats() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.get_AvailableFormats()
    }

    /**
     * Checks to see if the [DataPackageView](datapackageview.md) contains a specific data format.
     * @param {HSTRING} formatId The name of the format.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.contains
     */
    Contains(formatId) {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.Contains(formatId)
    }

    /**
     * Gets the data contained in the [DataPackageView](datapackageview.md).
     * @param {HSTRING} formatId Specifies the format of the data. We recommend that you set this value by using the [StandardDataFormats](standarddataformats.md) class.
     * @returns {IAsyncOperation<IInspectable>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getdataasync
     */
    GetDataAsync(formatId) {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetDataAsync(formatId)
    }

    /**
     * Gets the text in the [DataPackageView](datapackageview.md) object.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.gettextasync
     */
    GetTextAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetTextAsync()
    }

    /**
     * Gets the text in the [DataPackageView](datapackageview.md) object.
     * @param {HSTRING} formatId 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.gettextasync
     */
    GetCustomTextAsync(formatId) {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetCustomTextAsync(formatId)
    }

    /**
     * > [!NOTE]
     * > GetUriAsync may be altered or unavailable for releases after Windows 8.1. Instead, use [GetApplicationLink](datapackageview_getapplicationlinkasync_832271692.md) or [GetWebLink](datapackageview_getweblinkasync_1792258175.md).
     * 
     * Gets the URI contained in the [DataPackageView](datapackageview.md).
     * @returns {IAsyncOperation<Uri>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.geturiasync
     */
    GetUriAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetUriAsync()
    }

    /**
     * Gets the HTML stored in the [DataPackageView](datapackageview.md) object.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.gethtmlformatasync
     */
    GetHtmlFormatAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetHtmlFormatAsync()
    }

    /**
     * Gets the data (such as an image) referenced in HTML content.
     * @returns {IAsyncOperation<IMapView<HSTRING, RandomAccessStreamReference>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getresourcemapasync
     */
    GetResourceMapAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetResourceMapAsync()
    }

    /**
     * Gets the rich text formatted (RTF) content contained in a [DataPackageView](datapackageview.md).
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getrtfasync
     */
    GetRtfAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetRtfAsync()
    }

    /**
     * Gets the bitmap image contained in the [DataPackageView](datapackageview.md)
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getbitmapasync
     */
    GetBitmapAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetBitmapAsync()
    }

    /**
     * Gets the files and folders stored in a [DataPackageView](datapackageview.md) object.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getstorageitemsasync
     */
    GetStorageItemsAsync() {
        if (!this.HasProp("__IDataPackageView")) {
            if ((queryResult := this.QueryInterface(IDataPackageView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView := IDataPackageView(outPtr)
        }

        return this.__IDataPackageView.GetStorageItemsAsync()
    }

    /**
     * Gets the application link in the [DataPackageView](datapackageview.md) object.
     * @returns {IAsyncOperation<Uri>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getapplicationlinkasync
     */
    GetApplicationLinkAsync() {
        if (!this.HasProp("__IDataPackageView2")) {
            if ((queryResult := this.QueryInterface(IDataPackageView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView2 := IDataPackageView2(outPtr)
        }

        return this.__IDataPackageView2.GetApplicationLinkAsync()
    }

    /**
     * Gets the web link in the [DataPackageView](datapackageview.md) object.
     * @returns {IAsyncOperation<Uri>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.getweblinkasync
     */
    GetWebLinkAsync() {
        if (!this.HasProp("__IDataPackageView2")) {
            if ((queryResult := this.QueryInterface(IDataPackageView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView2 := IDataPackageView2(outPtr)
        }

        return this.__IDataPackageView2.GetWebLinkAsync()
    }

    /**
     * Requests permission to unlock and access a data package that is secured with a protection policy.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IDataPackageView3")) {
            if ((queryResult := this.QueryInterface(IDataPackageView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView3 := IDataPackageView3(outPtr)
        }

        return this.__IDataPackageView3.RequestAccessAsync()
    }

    /**
     * Requests permission to unlock and access a data package that is secured with a protection policy.
     * @param {HSTRING} enterpriseId 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.requestaccessasync
     */
    RequestAccessWithEnterpriseIdAsync(enterpriseId) {
        if (!this.HasProp("__IDataPackageView3")) {
            if ((queryResult := this.QueryInterface(IDataPackageView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView3 := IDataPackageView3(outPtr)
        }

        return this.__IDataPackageView3.RequestAccessWithEnterpriseIdAsync(enterpriseId)
    }

    /**
     * Unlocks a data package and assumes an enterprise identity for it.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.unlockandassumeenterpriseidentity
     */
    UnlockAndAssumeEnterpriseIdentity() {
        if (!this.HasProp("__IDataPackageView3")) {
            if ((queryResult := this.QueryInterface(IDataPackageView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView3 := IDataPackageView3(outPtr)
        }

        return this.__IDataPackageView3.UnlockAndAssumeEnterpriseIdentity()
    }

    /**
     * Sets the accepted format Id.
     * @param {HSTRING} formatId The format Id.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageview.setacceptedformatid
     */
    SetAcceptedFormatId(formatId) {
        if (!this.HasProp("__IDataPackageView4")) {
            if ((queryResult := this.QueryInterface(IDataPackageView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackageView4 := IDataPackageView4(outPtr)
        }

        return this.__IDataPackageView4.SetAcceptedFormatId(formatId)
    }

;@endregion Instance Methods
}
