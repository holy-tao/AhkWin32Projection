#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IDataPackagePropertySet.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\IDataPackagePropertySet2.ahk
#Include .\IDataPackagePropertySet3.ahk
#Include .\IDataPackagePropertySet4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a set of properties to use with a [DataPackage](datapackage.md) object.
 * @remarks
 * In addition to the content being shared, each instance of a [DataPackage](datapackage.md) object supports a set of properties. Target apps can use these properties to learn more about the content of the [DataPackage](datapackage.md).
 * 
 * This class directly supports several default properties, such as a [thumbnail](datapackagepropertyset_thumbnail.md), a [title](datapackagepropertyset_title.md), and a [description](datapackagepropertyset_description.md). You can also create your own custom properties by using the [Insert](datapackagepropertyset_insert_2123640444.md) method or one of the **Add** methods. Target apps can access specific properties through the [Lookup](datapackagepropertyset_lookup_711408188.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataPackagePropertySet extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPackagePropertySet

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPackagePropertySet.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text that displays as a title for the contents of the [DataPackage](datapackage.md) object.
     * @remarks
     * Setting this property is mandatory. Without it, any share operations involving the [DataPackage](datapackage.md) will fail.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets text that describes the contents of the [DataPackage](datapackage.md).
     * @remarks
     * We recommend adding a description to a [DataPackage](datapackage.md) object if you can. Target apps can use this description to help users identify what content they're sharing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets a thumbnail image for the [DataPackage](datapackage.md).
     * @remarks
     * We recommend that any time you create a [DataPackage](datapackage.md) that contains images, you also assign a thumbnail image. Doing so gives target apps the opportunity to display a visual representation of the images being shared to the user while the share operation completes.
     * 
     * The minimum recommended size is 80x80. The maximum size is 240x160. These sizes are in device-independent pixels, so if the system plateau setting is other than 1.0, appropriate multiplier should be used. For example, minimum recommended size for 1.4 plateau would be 80*1.4x80*1.4=112x112 physical pixels. If you're writing a target app, remember that while we recommend a minimum and maximum size, there is no enforcement of these sizes. Your app should have code to handle thumbnails that are an unexpected size—such as to scale them up or down as needed. Take care, however, not to alter the aspect ratio of the image.
     * 
     * You can use any data format (JPG, GIF, and so on) for a thumbnail. You also have the option of loading the thumbnail from the disk, or creating it on the fly.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.thumbnail
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Specifies a vector object that contains the types of files stored in the [DataPackage](datapackage.md) object.
     * @remarks
     * Many target apps accept a number of different file formats. Even so, they might prefer one format over another. By adding the file types supported in a [DataPackage](datapackage.md) to the **FileTypes** property, you can help those target apps select the most appropriate file format for a given operation.
     * 
     * If your app shares content using one of the formats that the [DataPackage](datapackage.md) object supports directly, such as [text](standarddataformats_text.md) or [Html](standarddataformats_html.md), you should use the [StandardDataFormats](standarddataformats.md) class when adding file types to this property. If your app supports a custom data format, you can add that format using a string. In cases where your app uses a delegate to add content to the [DataPackage](datapackage.md), you must ensure that the string you use in the **FileTypes** property matches the value of the *formatId* parameter of the [SetDataProvider](datapackage_setdataprovider_375548563.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.filetypes
     * @type {IVector<HSTRING>} 
     */
    FileTypes {
        get => this.get_FileTypes()
    }

    /**
     * Gets or sets the name of the app that created the [DataPackage](datapackage.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.applicationname
     * @type {HSTRING} 
     */
    ApplicationName {
        get => this.get_ApplicationName()
        set => this.put_ApplicationName(value)
    }

    /**
     * Gets or sets the Uniform Resource Identifier (URI) of the app's location in the Windows Store.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.applicationlistinguri
     * @type {Uri} 
     */
    ApplicationListingUri {
        get => this.get_ApplicationListingUri()
        set => this.put_ApplicationListingUri(value)
    }

    /**
     * Gets the number of items that are contained in the property set.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Provides a web link to shared content that's currently displayed in the app.
     * @remarks
     * ContentSourceWebLink is a companion property that you use to attribute shared content. It's shared when the app provides a web link to the content being shared. When the user makes an explicit selection, the [WebLink](standarddataformats_weblink.md) format isn't populated, because the value for the [WebLink](standarddataformats_weblink.md) format isn't the same as the user's selection. Populating this info doesn't mean that the web page is the user's selection, only that the content comes from there.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.contentsourceweblink
     * @type {Uri} 
     */
    ContentSourceWebLink {
        get => this.get_ContentSourceWebLink()
        set => this.put_ContentSourceWebLink(value)
    }

    /**
     * Gets or sets the application link to the content from the source app.
     * @remarks
     * ContentSourceApplicationLink is a companion property that you use to attribute shared content. It's shared when the app finds it meaningful for the user to return to the content that's currently displayed in the app. When the user makes a selection, the [ApplicationLink](standarddataformats_applicationlink.md) format isn't populated, because the value for [ApplicationLink](standarddataformats_applicationlink.md) format isn't the same as the user's selection. Populating this info doesn't mean that the deep link into the app represents the user's selection, only that the content comes from there.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.contentsourceapplicationlink
     * @type {Uri} 
     */
    ContentSourceApplicationLink {
        get => this.get_ContentSourceApplicationLink()
        set => this.put_ContentSourceApplicationLink(value)
    }

    /**
     * Gets or sets the package family name of the source app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
        set => this.put_PackageFamilyName(value)
    }

    /**
     * Gets or sets the source app's logo.
     * @remarks
     * The logo is padded with the color in [LogoBackgroundColor](datapackagepropertyset_logobackgroundcolor.md).
     * 
     * The source app should provide the logo that's appropriate for the current plateau level of the share UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.square30x30logo
     * @type {IRandomAccessStreamReference} 
     */
    Square30x30Logo {
        get => this.get_Square30x30Logo()
        set => this.put_Square30x30Logo(value)
    }

    /**
     * Gets or sets a background color for the sharing app's [Square30x30Logo](datapackagepropertyset_square30x30logo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.logobackgroundcolor
     * @type {Color} 
     */
    LogoBackgroundColor {
        get => this.get_LogoBackgroundColor()
        set => this.put_LogoBackgroundColor(value)
    }

    /**
     * Gets or sets the enterprise identity (see [Enterprise data protection](/windows/uwp/enterprise/wip-hub)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
        set => this.put_EnterpriseId(value)
    }

    /**
     * Gets or sets the [UserActivity](../windows.applicationmodel.useractivities/useractivity.md) in serialized JSON format to be shared with another app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.contentsourceuseractivityjson
     * @type {HSTRING} 
     */
    ContentSourceUserActivityJson {
        get => this.get_ContentSourceUserActivityJson()
        set => this.put_ContentSourceUserActivityJson(value)
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.put_Description(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_Thumbnail()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypes() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_FileTypes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationName() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_ApplicationName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ApplicationName(value) {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.put_ApplicationName(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationListingUri() {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.get_ApplicationListingUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ApplicationListingUri(value) {
        if (!this.HasProp("__IDataPackagePropertySet")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet := IDataPackagePropertySet(outPtr)
        }

        return this.__IDataPackagePropertySet.put_ApplicationListingUri(value)
    }

    /**
     * Retrieves the value of a specific property.
     * @remarks
     * With the **LookUp** method, you specify the name of the property that you want. This name can be a property that the object supports directly, such as title, or a custom property defined by the source app.
     * 
     * For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @param {Generic} key The key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.get_Size()
    }

    /**
     * Indicates whether the [DataPackagePropertySet](datapackagepropertyset.md) object contains a specific property.
     * @remarks
     * With the [DataPackagePropertySet](datapackagepropertyset.md) class, use **HasKey** as a way to see whether the object contains a specific property. This is useful in situations where your app requires a custom property that the [DataPackagePropertySet](datapackagepropertyset.md) object doesn't directly support. For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.HasKey(key)
    }

    /**
     * Gets an immutable view of the property set.
     * @remarks
     * Returns a [DataPackagePropertySetView](datapackagepropertysetview.md) object, which is an immutable view of the [DataPackagePropertySet](datapackagepropertyset.md) object. For more info, see [IMap(String, Object)](../windows.foundation.collections/imap_2.md).
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.getview
     */
    GetView() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.GetView()
    }

    /**
     * Adds a property to the [DataPackagePropertySet](datapackagepropertyset.md) object.
     * @remarks
     * Use this method if your app needs to add a custom property to the [DataPackagePropertySet](datapackagepropertyset.md) object. A custom property is any property that you can't define by using an existing property of the object. For example, [title](datapackagepropertyset_title.md) is a property that the object supports directly, but if you wanted a subtitle property, you would need to use **Insert** to add it.
     * 
     * For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @param {Generic} key The key to insert.
     * @param {Generic} value The value to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.insert
     */
    Insert(key, value) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Insert(key, value)
    }

    /**
     * Removes an item from the property set.
     * @remarks
     * Use **Remove** if you need to delete a property from the [DataPackagePropertySet](datapackagepropertyset.md) object.
     * 
     * For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * 
     * For the C# and Microsoft Visual Basic version of the **Remove(String)** method, see [Remove](/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.remove).
     * @param {Generic} key The key.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.remove
     */
    Remove(key) {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Remove(key)
    }

    /**
     * Removes all items from the property set.
     * @remarks
     * Use this method in situations where you want to remove all of the properties in a [DataPackagePropertySet](datapackagepropertyset.md) at the same time.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.clear
     */
    Clear() {
        if (!this.HasProp("__IMap")) {
            piid := Guid("{1b0d3570-0877-5ec2-8a2c-3b9539506aca}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMap := IMap((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMap.Clear()
    }

    /**
     * Returns an iterator to enumerate the items in the property set.
     * @remarks
     * For more info, see [IIterable(IKeyValuePair)](../windows.foundation.collections/iiterable_1.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertyset.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{fe2f3d47-5d47-5499-8374-430c7cda0204}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(IKeyValuePair.Call.Bind(IKeyValuePair, (ptr) => HSTRING({ Value: ptr }), IInspectable), outPtr)
        }

        return this.__IIterable.First()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceWebLink() {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.get_ContentSourceWebLink()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceWebLink(value) {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.put_ContentSourceWebLink(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceApplicationLink() {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.get_ContentSourceApplicationLink()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceApplicationLink(value) {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.put_ContentSourceApplicationLink(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.get_PackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PackageFamilyName(value) {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.put_PackageFamilyName(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Square30x30Logo() {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.get_Square30x30Logo()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Square30x30Logo(value) {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.put_Square30x30Logo(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LogoBackgroundColor() {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.get_LogoBackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_LogoBackgroundColor(value) {
        if (!this.HasProp("__IDataPackagePropertySet2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet2 := IDataPackagePropertySet2(outPtr)
        }

        return this.__IDataPackagePropertySet2.put_LogoBackgroundColor(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IDataPackagePropertySet3")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet3 := IDataPackagePropertySet3(outPtr)
        }

        return this.__IDataPackagePropertySet3.get_EnterpriseId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnterpriseId(value) {
        if (!this.HasProp("__IDataPackagePropertySet3")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet3 := IDataPackagePropertySet3(outPtr)
        }

        return this.__IDataPackagePropertySet3.put_EnterpriseId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentSourceUserActivityJson() {
        if (!this.HasProp("__IDataPackagePropertySet4")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet4 := IDataPackagePropertySet4(outPtr)
        }

        return this.__IDataPackagePropertySet4.get_ContentSourceUserActivityJson()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceUserActivityJson(value) {
        if (!this.HasProp("__IDataPackagePropertySet4")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySet4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySet4 := IDataPackagePropertySet4(outPtr)
        }

        return this.__IDataPackagePropertySet4.put_ContentSourceUserActivityJson(value)
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
