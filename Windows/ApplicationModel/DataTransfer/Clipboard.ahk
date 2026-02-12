#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClipboardStatics.ahk
#Include .\IClipboardStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets and sets information from the clipboard object.
 * @remarks
 * Because the Clipboard class is a static class, you don't need to create an instance of it to access its methods.
 * 
 * You can only access the clipboard when the calling application is in focus on the UI thread (for example, when its [CoreWindow](../windows.ui.core/corewindow.md) is active). Use the [CoreWindow.Activated](../windows.ui.core/corewindow_activated.md) event to track the state of the calling app.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class Clipboard extends IInspectable {
;@region Static Methods
    /**
     * Gets the current content that is stored in the clipboard object.
     * @remarks
     * If the **GetContent** call is successful, you can use the [DataPackageView](datapackageview.md) it returns to get information such as the file types it supports and any properties that the source app assigned through the [DataPackagePropertySet](datapackagepropertyset.md) class.
     * @returns {DataPackageView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.getcontent
     */
    static GetContent() {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.GetContent()
    }

    /**
     * Sets the current content that is stored in the clipboard object.
     * @remarks
     * Use this method after creating and defining a [DataPackage](datapackage.md) with the data you want to put on the clipboard. Call this method only when the application is in the foreground, or when a debugger is attached.
     * 
     * If the content cannot be set to the clipboard (for example, because the application is not in the foreground), the method throws an exception. Use the [SetContentWithOptions](clipboard_setcontentwithoptions_595822094.md) method to set clipboard content without an exception.
     * 
     * The content is eligible for clipboard history and can be synced to other devices. To exclude the content from clipboard history and syncing, use the [SetContentWithOptions](clipboard_setcontentwithoptions_595822094.md) method.
     * @param {DataPackage} content Contains the content of the clipboard. If **NULL**, the clipboard is emptied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.setcontent
     */
    static SetContent(content) {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.SetContent(content)
    }

    /**
     * Adds the content to the Clipboard and releases the [DataPackage](datapackage.md) object from the source app. This method allows the content to remain available after the application shuts down.
     * @remarks
     * When you call the Flush method, the content of the [DataPackage](datapackage.md) is added to the Clipboard and then released from the source app. This action makes the content available on the Clipboard even after the source app is no longer available.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.flush
     */
    static Flush() {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.Flush()
    }

    /**
     * Removes all data from the Clipboard.
     * @remarks
     * If the Clipboard cannot be cleared, the method throws an exception.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.clear
     */
    static Clear() {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.Clear()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ContentChanged(handler) {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.add_ContentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ContentChanged(token) {
        if (!Clipboard.HasProp("__IClipboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics.IID)
            Clipboard.__IClipboardStatics := IClipboardStatics(factoryPtr)
        }

        return Clipboard.__IClipboardStatics.remove_ContentChanged(token)
    }

    /**
     * Gets the list of items currently in the clipboard history.
     * @returns {IAsyncOperation<ClipboardHistoryItemsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.gethistoryitemsasync
     */
    static GetHistoryItemsAsync() {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.GetHistoryItemsAsync()
    }

    /**
     * Clears the clipboard history.
     * @remarks
     * Note that **ClearHistory** doesn't clear pinned items from the clipboard history.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.clearhistory
     */
    static ClearHistory() {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.ClearHistory()
    }

    /**
     * Deletes the specified item from the clipboard history.
     * @param {ClipboardHistoryItem} item The item to remove from the clipboard history.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.deleteitemfromhistory
     */
    static DeleteItemFromHistory(item) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.DeleteItemFromHistory(item)
    }

    /**
     * Sets an item in the clipboard history as the current content for the clipboard.
     * @param {ClipboardHistoryItem} item The item in the clipboard history to set as the current content for the clipboard.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.sethistoryitemascontent
     */
    static SetHistoryItemAsContent(item) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.SetHistoryItemAsContent(item)
    }

    /**
     * Indicates whether clipboard history (that is, the ability to save multiple items to the clipboard) is enabled for the current user.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.ishistoryenabled
     */
    static IsHistoryEnabled() {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.IsHistoryEnabled()
    }

    /**
     * Indicates whether clipboard data is set to sync across devices for the current user.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.isroamingenabled
     */
    static IsRoamingEnabled() {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.IsRoamingEnabled()
    }

    /**
     * Sets the content that is stored in the clipboard object with options for the content.
     * @param {DataPackage} content Contains the content to store in the clipboard. This parameter may not be null.
     * @param {ClipboardContentOptions} options An object that specifies options for the clipboard content, such as whether the content is allowed in the clipboard history and whether it will be synced to other devices. This parameter may be null, in which case default options are used.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.clipboard.setcontentwithoptions
     */
    static SetContentWithOptions(content, options) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.SetContentWithOptions(content, options)
    }

    /**
     * 
     * @param {EventHandler<ClipboardHistoryChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_HistoryChanged(handler) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.add_HistoryChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_HistoryChanged(token) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.remove_HistoryChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RoamingEnabledChanged(handler) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.add_RoamingEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RoamingEnabledChanged(token) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.remove_RoamingEnabledChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_HistoryEnabledChanged(handler) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.add_HistoryEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_HistoryEnabledChanged(token) {
        if (!Clipboard.HasProp("__IClipboardStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.Clipboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClipboardStatics2.IID)
            Clipboard.__IClipboardStatics2 := IClipboardStatics2(factoryPtr)
        }

        return Clipboard.__IClipboardStatics2.remove_HistoryEnabledChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
