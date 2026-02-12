#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IQuickLink.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents shortcuts that help users share content with the apps they use most.
 * @remarks
 * > Quicklinks are not supported on Windows Phone 8.1. Apps running on Windows Phone 8.1 can still receive Quicklinks as part of a share operation, but they will be automatically ignored.
 * 
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink
 * @namespace Windows.ApplicationModel.DataTransfer.ShareTarget
 * @version WindowsRuntime 1.4
 */
class QuickLink extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IQuickLink

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IQuickLink.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the title of a QuickLink. The system displays this info when the user is presented with a list of possible apps to share content with.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Specifies a thumbnail image for the QuickLink. The system displays this image when the user is presented with a list of possible apps to share content with.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink.thumbnail
     * @type {RandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * Specifies an ID for the QuickLink. Your app receives this ID when the user selects its QuickLink. You can use this ID to further customize the sharing process for the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * An array of strings that specify the data formats supported by the QuickLink app. The system shows the QuickLink only when the data that a user wants to share matches a format in this array.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink.supporteddataformats
     * @type {IVector<HSTRING>} 
     */
    SupportedDataFormats {
        get => this.get_SupportedDataFormats()
    }

    /**
     * An array of strings that specify the file types supported by a QuickLink app. The system shows the QuickLink only when the data that a user wants to share contains file items, and the file extensions for those file items match a file type in this array.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.quicklink.supportedfiletypes
     * @type {IVector<HSTRING>} 
     */
    SupportedFileTypes {
        get => this.get_SupportedFileTypes()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a QuickLink object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.ShareTarget.QuickLink")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.put_Title(value)
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_Thumbnail() {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.get_Thumbnail()
    }

    /**
     * 
     * @param {RandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Thumbnail(value) {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.put_Thumbnail(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.put_Id(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedDataFormats() {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.get_SupportedDataFormats()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedFileTypes() {
        if (!this.HasProp("__IQuickLink")) {
            if ((queryResult := this.QueryInterface(IQuickLink.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuickLink := IQuickLink(outPtr)
        }

        return this.__IQuickLink.get_SupportedFileTypes()
    }

;@endregion Instance Methods
}
