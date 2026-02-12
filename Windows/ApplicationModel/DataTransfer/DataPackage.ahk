#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataPackage.ahk
#Include .\IDataPackage2.ahk
#Include .\IDataPackage3.ahk
#Include .\IDataPackage4.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DataPackage.ahk
#Include .\OperationCompletedEventArgs.ahk
#Include .\ShareCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains the data that a user wants to exchange with another app.
 * @remarks
 * During a share operation, the source app puts the data being shared in a **DataPackage** object and sends that object to the target app for processing. The **DataPackage** class includes a number of methods to support the following default formats: [text](standarddataformats_text.md), [Rtf](standarddataformats_rtf.md), [Html](standarddataformats_html.md), [Bitmap](standarddataformats_bitmap.md), and [StorageItems](standarddataformats_storageitems.md). It also has methods to support custom data formats. To use these formats, both the source app and target app must already be aware that the custom format exists.
 * 
 * Source apps have the option of using [SetDataProvider](datapackage_setdataprovider_375548563.md) to assign a delegate to a **DataPackage**, instead of providing the data immediately. This process is useful when the source app supports a given format but does not want to generate the data unless the target app requests the data. For example, a source app might support a variety of image formats for sharing photos. Instead of creating multiple copies of each image using these formats, the source app can use a delegate that is called when the target app requests a specific format type.
 * 
 * Target apps can use the [DataPackageView](datapackageview.md) object to acquire the data being shared. In addition, these apps can use the [AvailableFormats](datapackageview_availableformats.md) property to identify which formats the [DataPackageView](datapackageview.md) supports, or use the [Contains](datapackageview_contains_1741733936.md) method to query for a specific format.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataPackage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPackage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPackage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Allows you to get and set properties like the title of the content being shared.
     * @remarks
     * In addition to the content being shared, each instance of a [DataPackage](datapackage.md) object supports a set of properties. Target apps can use these properties to learn more about the content of the [DataPackage](datapackage.md). Examples of common properties include [thumbnail](datapackagepropertyset_thumbnail.md) images, [title](datapackagepropertyset_title.md), and [file types](datapackagepropertyset_filetypes.md).
     * 
     * This property contains an instance of the [DataPackagePropertySet](datapackagepropertyset.md) class. This class supports several properties by default. This class also supports custom properties through its [Insert](datapackagepropertyset_insert_2123640444.md) and [Lookup](datapackagepropertyset_lookup_711408188.md) methods.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.properties
     * @type {DataPackagePropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Specifies the [DataPackageOperation](datapackageoperation.md) (none, move, copy, or link) for the operation.
     * @remarks
     * This property specifies the operation the consumer of a data package should perform in clipboard or drag and drop scenarios. The supported options are specified in the [DataPackageOperation](datapackageoperation.md) enumeration.
     * 
     * When implementing clipboard functionality, [DataPackageOperation.Move](datapackageoperation.md) corresponds to the "Cut" command and [DataPackageOperation.Copy](datapackageoperation.md) to "Copy" command. It is the target of the operation's responsibility to respect this value and report that they performed a cut or copy by calling [DataPackageView.ReportOperationComplete](datapackageview_reportoperationcompleted_467480582.md) with the appropriate value.
     * 
     * In drag and drop scenarios, [CoreDragOperation.AllowedOperations](../windows.applicationmodel.datatransfer.dragdrop.core/coredraginfo_allowedoperations.md) should specify the complete set of operations the source allows, and DataPackage.RequestedOperation should specify the source's desired default. Users can override this choices by using **SHIFT** and **CTRL** keys. Target apps must inspect the key state to determine the operation the user has selected. 
     * 
     * > [!NOTE]
     * > [CoreDragOperation.AllowedOperations](../windows.applicationmodel.datatransfer.dragdrop.core/coredraginfo_allowedoperations.md) is not supported in XAML. To specify more than one allowed operation in XAML, pass multiple flags to the DataPackage.RequestedOperation property instead. If you do, you should not set [CoreDragOperation.AllowedOperations](../windows.applicationmodel.datatransfer.dragdrop.core/coredraginfo_allowedoperations.md) elsewhere. Doing so will throw an exception and reset the specified flags of DataPackage.RequestedOperation to one.
     * 
     * Normally, DataPackage.RequestedOperation property should specify only a single operation. However, in some interop scenarios (such as copying between a Universal Windows Platform (UWP) app and File Explorer), it can contain more. In this case, the target app should select the best operation (assuming keyboard modifiers have not overridden that choice).
     * 
     * You do not need this property for sharing operations.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.requestedoperation
     * @type {Integer} 
     */
    RequestedOperation {
        get => this.get_RequestedOperation()
        set => this.put_RequestedOperation(value)
    }

    /**
     * Maps a URI to a file. Used to ensure that referenced content (such as an image) in HTML content is added to the [DataPackage](datapackage.md).
     * @remarks
     * HTML content often contains references to other files. The most common example is an img tag that refers to a specific file. To ensure that the image is sent with the rest of the HTML content, you need to use `ResourceMap`, which maps the URI string to the actual data. You can learn more about this in [How to share HTML](/previous-versions/windows/apps/hh758310(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.resourcemap
     * @type {IMap<HSTRING, RandomAccessStreamReference>} 
     */
    ResourceMap {
        get => this.get_ResourceMap()
    }

    /**
     * Occurs when a paste operation is completed.
     * @remarks
     * This event occurs when a user or program pastes content from the Clipboard. If your app is using the [DataPackage](datapackage.md) for share operations, you do not have to handle this event.
     * @type {TypedEventHandler<DataPackage, OperationCompletedEventArgs>}
    */
    OnOperationCompleted {
        get {
            if(!this.HasProp("__OnOperationCompleted")){
                this.__OnOperationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{dd48af6c-ef9a-59cb-b326-57d9e2411f21}"),
                    DataPackage,
                    OperationCompletedEventArgs
                )
                this.__OnOperationCompletedToken := this.add_OperationCompleted(this.__OnOperationCompleted.iface)
            }
            return this.__OnOperationCompleted
        }
    }

    /**
     * Occurs when the [DataPackage](datapackage.md) is destroyed.
     * @remarks
     * In general, the system handles the destruction of a [DataPackage](datapackage.md) object. Your app should not have to handle this event.
     * @type {TypedEventHandler<DataPackage, IInspectable>}
    */
    OnDestroyed {
        get {
            if(!this.HasProp("__OnDestroyed")){
                this.__OnDestroyed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c156b0c3-1cbc-5ca4-901c-62c5a8ca5cb5}"),
                    DataPackage,
                    IInspectable
                )
                this.__OnDestroyedToken := this.add_Destroyed(this.__OnDestroyed.iface)
            }
            return this.__OnDestroyed
        }
    }

    /**
     * An event that is triggered when a share is completed. Shares can be sent to an app, a provider, or a contact.
     * @remarks
     * > [!NOTE]
     * > Selecting "Copy link" is not considered a *share* and thus does not fire this event, nor `ShareCanceled`.
     * @type {TypedEventHandler<DataPackage, ShareCompletedEventArgs>}
    */
    OnShareCompleted {
        get {
            if(!this.HasProp("__OnShareCompleted")){
                this.__OnShareCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f8f7e24a-56fe-58df-bc15-2365aec03966}"),
                    DataPackage,
                    ShareCompletedEventArgs
                )
                this.__OnShareCompletedToken := this.add_ShareCompleted(this.__OnShareCompleted.iface)
            }
            return this.__OnShareCompleted
        }
    }

    /**
     * Raised when a share is canceled.
     * @type {TypedEventHandler<DataPackage, IInspectable>}
    */
    OnShareCanceled {
        get {
            if(!this.HasProp("__OnShareCanceled")){
                this.__OnShareCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c156b0c3-1cbc-5ca4-901c-62c5a8ca5cb5}"),
                    DataPackage,
                    IInspectable
                )
                this.__OnShareCanceledToken := this.add_ShareCanceled(this.__OnShareCanceled.iface)
            }
            return this.__OnShareCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructor that creates a new [DataPackage](datapackage.md).
     * @remarks
     * In general, the system handles the destruction of a [DataPackage](datapackage.md) object. Your app should not have to handle this event.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DataPackage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOperationCompletedToken")) {
            this.remove_OperationCompleted(this.__OnOperationCompletedToken)
            this.__OnOperationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnDestroyedToken")) {
            this.remove_Destroyed(this.__OnDestroyedToken)
            this.__OnDestroyed.iface.Dispose()
        }

        if(this.HasProp("__OnShareCompletedToken")) {
            this.remove_ShareCompleted(this.__OnShareCompletedToken)
            this.__OnShareCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnShareCanceledToken")) {
            this.remove_ShareCanceled(this.__OnShareCanceledToken)
            this.__OnShareCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns a [DataPackageView](datapackageview.md) object. This object is a read-only copy of the [DataPackage](datapackage.md) object.
     * @returns {DataPackageView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.getview
     */
    GetView() {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.GetView()
    }

    /**
     * 
     * @returns {DataPackagePropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedOperation() {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.get_RequestedOperation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestedOperation(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.put_RequestedOperation(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, OperationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OperationCompleted(handler) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.add_OperationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OperationCompleted(token) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.remove_OperationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Destroyed(handler) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.add_Destroyed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Destroyed(token) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.remove_Destroyed(token)
    }

    /**
     * Sets the data contained in the [DataPackage](datapackage.md) in a [RandomAccessStream](../windows.storage.streams/randomaccessstream.md) format.
     * @remarks
     * To add data with this method, your app must convert the data into an object. You must also specify a *formatId* that target apps can use to request the data. The target app can request this data only if it knows the *formatId*.
     * 
     * Use this method when you use a delegate function to share data. For more information, see [How to support pull operations](/previous-versions/windows/apps/hh770848(v=win.10)).
     * @param {HSTRING} formatId Specifies the format of the data. Set this value by using the [StandardDataFormats](standarddataformats.md) class.
     * @param {IInspectable} value Specifies the content that the [DataPackage](datapackage.md) contains.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setdata
     */
    SetData(formatId, value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetData(formatId, value)
    }

    /**
     * Sets a delegate to handle requests from the target app.
     * @remarks
     * Use the **SetDataProvider** method when your app supports a specific format, but does not want to supply the data until the target app requests it. We encourage you to use this method if your app shares content that can require significant processing time; for example, sharing a selection of photos, videos, or files.
     * 
     * When you use this method, you need to specify a format and a function. You can specify the format by using the [StandardDataFormats](standarddataformats.md) class, or you can use a string value for a custom format. The function must put data in the [DataPackage](datapackage.md) by using a method like [SetData](datapackage_setdata_2074524277.md).
     * 
     * You must specify the extension of the [StorageItems](standarddataformats_storageitems.md) being passed to the Share Target.
     * 
     * The **SetDataProvider** method is different from the [GetDeferral](datarequest_getdeferral_254836512.md) method of the [DataRequest](datarequest.md) class. With [GetDeferral](datarequest_getdeferral_254836512.md), a source app can call a function that immediately puts the data in the [DataPackage](datapackage.md) object. The **SetDataProvider** method is for more complex share operations where packaging the data to be shared is more time-intensive or resource-intensive.
     * @param {HSTRING} formatId Specifies the format of the data. We recommend that you set this value by using the [StandardDataFormats](standarddataformats.md) class.
     * @param {DataProviderHandler} delayRenderer A delegate that is responsible for processing requests from a target app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setdataprovider
     */
    SetDataProvider(formatId, delayRenderer) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetDataProvider(formatId, delayRenderer)
    }

    /**
     * Sets the text that a [DataPackage](datapackage.md) contains.
     * @remarks
     * This method sets the text value for [StandardDataFormats.Text](standarddataformats_text.md). It's the equivalent of calling `dataPackage.setText(StandardDataFormats.Text)`.
     * 
     * Text is one of the data types that the [DataPackage](datapackage.md) object supports directly. See the [StandardDataFormats](standarddataformats.md) class for information on other supported data types.
     * @param {HSTRING} value The text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.settext
     */
    SetText(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetText(value)
    }

    /**
     * > [!NOTE]
     * > SetUri may be altered or unavailable for releases after Windows 8.1. Instead, use [ApplicationLink](datapackage_setapplicationlink_1143215413.md) or [WebLink](datapackage_setweblink_224257999.md).
     * 
     * Sets the Uniform Resource Identifier (URI) that is contained in the [DataPackage](datapackage.md).
     * @remarks
     * This method sets the value for [StandardFormats.Uri](standarddataformats_uri.md).
     * 
     * Uniform Resource Identifier (URI) is one of the data types that the [DataPackage](datapackage.md) object supports directly. See the [StandardDataFormats](standarddataformats.md) class for information on other supported data types.
     * @param {Uri} value The Uniform Resource Identifier (URI) that is contained in the [DataPackage](datapackage.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.seturi
     */
    SetUri(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetUri(value)
    }

    /**
     * Adds HTML content to the [DataPackage](datapackage.md).
     * @remarks
     * To ensure that a target app can process the HTML content, use [HtmlFormatHelper.CreateHtmlFormat](htmlformathelper_createhtmlformat_180504809.md). It adds the required headers and other information the string containing the HTML.
     * 
     * If your app supports selection or copying/pasting of HTML content that contains [img](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) elements, be sure that the **src** attributes specify fully-qualified absolute paths to the images, not relative paths.
     * @param {HSTRING} value The HTML content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.sethtmlformat
     */
    SetHtmlFormat(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetHtmlFormat(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, RandomAccessStreamReference>} 
     */
    get_ResourceMap() {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.get_ResourceMap()
    }

    /**
     * Sets the Rich Text Format (RTF) content that is contained in a [DataPackage](datapackage.md).
     * @remarks
     * This method sets the value for [StandardFormats.Rtf](standarddataformats_rtf.md).
     * 
     * Rich Text Format (RTF) is one of the data types that the [DataPackage](datapackage.md) object supports directly. See the [StandardDataFormats](standarddataformats.md) class for info on other supported data types.
     * @param {HSTRING} value Specifies the Rich Text Format (RTF) content for the [DataPackage](datapackage.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setrtf
     */
    SetRtf(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetRtf(value)
    }

    /**
     * Sets the bitmap image contained in the [DataPackage](datapackage.md).
     * @remarks
     * This method sets the value for [StandardFormats.Bitmap](standarddataformats_bitmap.md).
     * 
     * Bitmap is one of the data types that the [DataPackage](datapackage.md) object supports directly. See the [StandardDataFormats](standarddataformats.md) class for information on other supported data types.
     * @param {RandomAccessStreamReference} value A stream that contains the bitmap image.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setbitmap
     */
    SetBitmap(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetBitmap(value)
    }

    /**
     * Sets the files and folders contained in a [DataPackage](datapackage.md).
     * @param {IIterable<IStorageItem>} value The files and folders to be added to the [DataPackage](datapackage.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setstorageitems
     */
    SetStorageItemsReadOnly(value) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetStorageItemsReadOnly(value)
    }

    /**
     * Adds files and folders to a [DataPackage](datapackage.md).
     * @param {IIterable<IStorageItem>} value The files and folders to be added to the [DataPackage](datapackage.md).
     * @param {Boolean} readOnly Specify true if the files are read-only; false otherwise.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setstorageitems
     */
    SetStorageItems(value, readOnly) {
        if (!this.HasProp("__IDataPackage")) {
            if ((queryResult := this.QueryInterface(IDataPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage := IDataPackage(outPtr)
        }

        return this.__IDataPackage.SetStorageItems1(value, readOnly)
    }

    /**
     * Sets the application link that a [DataPackage](datapackage.md) contains.
     * @remarks
     * Whenever possible, you should set this property. This Uniform Resource Identifier (URI) represents a deep link that takes the user back to the currently displayed content. A source app provides a value for this property, and a target app reads the value. Use this property to indicate the source of the shared content.
     * 
     * The scheme of this Uniform Resource Identifier (URI) must not be **http** or **https**. The app sharing this Uniform Resource Identifier (URI) must be capable of being the default handler, although it may not be set as the default handler.
     * @param {Uri} value A Uniform Resource Identifier (URI) with a scheme that isn't **http** or **https** that's handled by the source app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setapplicationlink
     */
    SetApplicationLink(value) {
        if (!this.HasProp("__IDataPackage2")) {
            if ((queryResult := this.QueryInterface(IDataPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage2 := IDataPackage2(outPtr)
        }

        return this.__IDataPackage2.SetApplicationLink(value)
    }

    /**
     * Sets the web link that a [DataPackage](datapackage.md) contains.
     * @remarks
     * Whenever possible, you should set this property. A source app provides a value for this property, and a target app reads the value. Use this property to indicate the source of the shared content.
     * @param {Uri} value A Uniform Resource Identifier (URI) with an **http** or **https** scheme that corresponds to the content being displayed to the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackage.setweblink
     */
    SetWebLink(value) {
        if (!this.HasProp("__IDataPackage2")) {
            if ((queryResult := this.QueryInterface(IDataPackage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage2 := IDataPackage2(outPtr)
        }

        return this.__IDataPackage2.SetWebLink(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, ShareCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShareCompleted(handler) {
        if (!this.HasProp("__IDataPackage3")) {
            if ((queryResult := this.QueryInterface(IDataPackage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage3 := IDataPackage3(outPtr)
        }

        return this.__IDataPackage3.add_ShareCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShareCompleted(token) {
        if (!this.HasProp("__IDataPackage3")) {
            if ((queryResult := this.QueryInterface(IDataPackage3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage3 := IDataPackage3(outPtr)
        }

        return this.__IDataPackage3.remove_ShareCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShareCanceled(handler) {
        if (!this.HasProp("__IDataPackage4")) {
            if ((queryResult := this.QueryInterface(IDataPackage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage4 := IDataPackage4(outPtr)
        }

        return this.__IDataPackage4.add_ShareCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShareCanceled(token) {
        if (!this.HasProp("__IDataPackage4")) {
            if ((queryResult := this.QueryInterface(IDataPackage4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackage4 := IDataPackage4(outPtr)
        }

        return this.__IDataPackage4.remove_ShareCanceled(token)
    }

;@endregion Instance Methods
}
