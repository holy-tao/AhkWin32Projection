#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IKeyValuePair.ahk
#Include .\IDataPackagePropertySetView.ahk
#Include .\IDataPackagePropertySetView2.ahk
#Include .\IDataPackagePropertySetView3.ahk
#Include .\IDataPackagePropertySetView4.ahk
#Include .\IDataPackagePropertySetView5.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets the set of properties of a [DataPackageView](datapackageview.md) object.
 * @remarks
 * In addition to the content being shared, each instance of a [DataPackageView](datapackageview.md) object supports a set of properties. Target apps can use these properties to learn more about the content of the [DataPackageView](datapackageview.md).
 * 
 * This class directly supports several default properties, such as a [thumbnail](datapackagepropertysetview_thumbnail.md), a [title](datapackagepropertysetview_title.md), and a [description](datapackagepropertysetview_description.md). Target apps can access specific properties through the [Lookup](datapackagepropertysetview_lookup_711408188.md) method.
 * 
 * > When a share target receives shared content, it also receives certain properties associated with the source app as a part of the [DataPackageView](datapackageview.md). In Windows Runtime app, several of these properties, such as [ApplicationListingUri](datapackagepropertysetview_applicationlistinguri.md), [ApplicationName](datapackagepropertysetview_applicationname.md), and [PackageFamilyName](datapackagepropertysetview_packagefamilyname.md), will be set by the operating system. In Windows Phone Silverlight apps, however, these properties will not be automatically filled and must be set manually.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataPackagePropertySetView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPackagePropertySetView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPackagePropertySetView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text that displays as a title for the contents of the [DataPackagePropertySetView](datapackagepropertysetview.md) object.
     * @remarks
     * We recommend you get and display the title when processing a [DataPackagePropertySetView](datapackagepropertysetview.md) object. It can help users distinguish between one share operation and another.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the text that describes the contents of the [DataPackage](datapackage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the thumbnail image for the [DataPackageView](datapackageview.md).
     * @remarks
     * We recommend that any time you get a [DataPackageView](datapackageview.md) that contains an image, you also check for thumbnail image. Doing so gives allows your app to display a visual representation of the images being shared to the user while the share operation completes.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.thumbnail
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * Gets a vector object that contains the types of files stored in the [DataPackage](datapackage.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.filetypes
     * @type {IVectorView<HSTRING>} 
     */
    FileTypes {
        get => this.get_FileTypes()
    }

    /**
     * Gets the name of the app that created the [DataPackage](datapackage.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.applicationname
     * @type {HSTRING} 
     */
    ApplicationName {
        get => this.get_ApplicationName()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the app's location in the Microsoft Store.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.applicationlistinguri
     * @type {Uri} 
     */
    ApplicationListingUri {
        get => this.get_ApplicationListingUri()
    }

    /**
     * Gets the package family name of the source app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Gets a web link to shared content that's currently displayed in the app.
     * @remarks
     * ContentSourceWebLink is a companion property that you use to attribute shared content. It's shared when the app provides a web link to the content being shared. When the user makes an explicit selection, the [WebLink](standarddataformats_weblink.md) format isn't populated, because the value for the [WebLink](standarddataformats_weblink.md) format isn't the same as the user's selection. Populating this info doesn't mean that the web page is the user's selection, only that the content comes from there.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.contentsourceweblink
     * @type {Uri} 
     */
    ContentSourceWebLink {
        get => this.get_ContentSourceWebLink()
    }

    /**
     * Gets the application link to the content from the source app.
     * @remarks
     * ContentSourceApplicationLink is a companion property that you use to attribute shared content. It's shared when the app finds it meaningful for the user to return to the content that's currently displayed in the app. When the user makes a selection, the [ApplicationLink](standarddataformats_applicationlink.md) format isn't populated, because the value for [ApplicationLink](standarddataformats_applicationlink.md) format isn't the same as the user's selection. Populating this info doesn't mean that the deep link into the app represents the user's selection, only that the content comes from there.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.contentsourceapplicationlink
     * @type {Uri} 
     */
    ContentSourceApplicationLink {
        get => this.get_ContentSourceApplicationLink()
    }

    /**
     * Gets the source app's logo.
     * @remarks
     * The logo is padded with the color in [LogoBackgroundColor](datapackagepropertyset_logobackgroundcolor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.square30x30logo
     * @type {IRandomAccessStreamReference} 
     */
    Square30x30Logo {
        get => this.get_Square30x30Logo()
    }

    /**
     * Gets a background color for the sharing app's [Square30x30Logo](datapackagepropertysetview_square30x30logo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.logobackgroundcolor
     * @type {Color} 
     */
    LogoBackgroundColor {
        get => this.get_LogoBackgroundColor()
    }

    /**
     * Gets or sets the enterprise Id.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * Gets the [UserActivity](../windows.applicationmodel.useractivities/useractivity.md) in serialized JSON format to be shared with another app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.contentsourceuseractivityjson
     * @type {HSTRING} 
     */
    ContentSourceUserActivityJson {
        get => this.get_ContentSourceUserActivityJson()
    }

    /**
     * Gets a value that indicates whether the shared content in the [DataPackageView](datapackageview.md) comes from clipboard data that was synced from another device for the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.isfromroamingclipboard
     * @type {Boolean} 
     */
    IsFromRoamingClipboard {
        get => this.get_IsFromRoamingClipboard()
    }

    /**
     * Gets the number of items that are contained in the property set.
     * @remarks
     * For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
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
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_Description()
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_Thumbnail()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_FileTypes() {
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_FileTypes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationName() {
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_ApplicationName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationListingUri() {
        if (!this.HasProp("__IDataPackagePropertySetView")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView := IDataPackagePropertySetView(outPtr)
        }

        return this.__IDataPackagePropertySetView.get_ApplicationListingUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IDataPackagePropertySetView2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView2 := IDataPackagePropertySetView2(outPtr)
        }

        return this.__IDataPackagePropertySetView2.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceWebLink() {
        if (!this.HasProp("__IDataPackagePropertySetView2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView2 := IDataPackagePropertySetView2(outPtr)
        }

        return this.__IDataPackagePropertySetView2.get_ContentSourceWebLink()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentSourceApplicationLink() {
        if (!this.HasProp("__IDataPackagePropertySetView2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView2 := IDataPackagePropertySetView2(outPtr)
        }

        return this.__IDataPackagePropertySetView2.get_ContentSourceApplicationLink()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Square30x30Logo() {
        if (!this.HasProp("__IDataPackagePropertySetView2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView2 := IDataPackagePropertySetView2(outPtr)
        }

        return this.__IDataPackagePropertySetView2.get_Square30x30Logo()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LogoBackgroundColor() {
        if (!this.HasProp("__IDataPackagePropertySetView2")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView2 := IDataPackagePropertySetView2(outPtr)
        }

        return this.__IDataPackagePropertySetView2.get_LogoBackgroundColor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IDataPackagePropertySetView3")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView3 := IDataPackagePropertySetView3(outPtr)
        }

        return this.__IDataPackagePropertySetView3.get_EnterpriseId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentSourceUserActivityJson() {
        if (!this.HasProp("__IDataPackagePropertySetView4")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView4 := IDataPackagePropertySetView4(outPtr)
        }

        return this.__IDataPackagePropertySetView4.get_ContentSourceUserActivityJson()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromRoamingClipboard() {
        if (!this.HasProp("__IDataPackagePropertySetView5")) {
            if ((queryResult := this.QueryInterface(IDataPackagePropertySetView5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPackagePropertySetView5 := IDataPackagePropertySetView5(outPtr)
        }

        return this.__IDataPackagePropertySetView5.get_IsFromRoamingClipboard()
    }

    /**
     * Retrieves the value of a specific property.
     * @remarks
     * With the **LookUp** method, you specify the name of the property that you want. This name can be a property that the object supports directly, such as title, or a custom property defined by the source app.
     * 
     * For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @param {Generic} key The key.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.lookup
     */
    Lookup(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Lookup(key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.get_Size()
    }

    /**
     * Indicates whether the [DataPackagePropertySetView](datapackagepropertysetview.md) object contains a specific property.
     * @remarks
     * With the [DataPackagePropertySetView](datapackagepropertysetview.md) class, use **HasKey** as a way to see whether the object contains a specific property. This is useful in situations where your app requires a custom property that the [DataPackagePropertySetView](datapackagepropertysetview.md) object doesn't directly support. For more info, see [IMapView(String, Object)](../windows.foundation.collections/imapview_2.md).
     * @param {Generic} key The key.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.haskey
     */
    HasKey(key) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.HasKey(key)
    }

    /**
     * Divides the object into two views
     * @param {Pointer<IMapView>} first The first half of the object.
     * @param {Pointer<IMapView>} second The second half of the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.split
     */
    Split(first, second) {
        if (!this.HasProp("__IMapView")) {
            piid := Guid("{bb78502a-f79d-54fa-92c9-90c5039fdf7e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapView := IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, outPtr)
        }

        return this.__IMapView.Split(first, second)
    }

    /**
     * Returns an iterator to enumerate the items in the property set.
     * @remarks
     * For more info, see [IIterable(IKeyValuePair)](../windows.foundation.collections/iiterable_1.md).
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackagepropertysetview.first
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

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
