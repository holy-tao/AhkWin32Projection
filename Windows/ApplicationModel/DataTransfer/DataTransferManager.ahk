#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataTransferManager.ahk
#Include .\IDataTransferManager2.ahk
#Include .\IDataTransferManagerStatics2.ahk
#Include .\IDataTransferManagerStatics.ahk
#Include .\IDataTransferManagerStatics3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DataTransferManager.ahk
#Include .\DataRequestedEventArgs.ahk
#Include .\TargetApplicationChosenEventArgs.ahk
#Include .\ShareProvidersRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Programmatically initiates an exchange of content with other apps.
 * @remarks
 * The **DataTransferManager** class is a static class that you use to initiate sharing operations. To use the class, first call the [GetForCurrentView](datatransfermanager_getforcurrentview_1363600702.md) method. This method returns the **DataTransferManager** object that is specific to the active window. Next, you need to add an event listener for the [datarequested](datatransfermanager_datarequested.md) event to the object. This event is fired when a sharing operation starts— typically when the user taps the Share charm, although it is also fired if your app starts a share operation programmatically.
 * 
 * The **DataTransferManager** class includes a [ShowShareUI](datatransfermanager_showshareui_1578854276.md) method, which you can use to programmatically start a share operation.
 * 
 * The **DataTransferManager** class also has a [TargetApplicationChosen](datatransfermanager_targetapplicationchosen.md) event. Use this event when you want to capture what applications a user selects when sharing content from your app.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataTransferManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataTransferManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataTransferManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns true if the device supports sharing, false otherwise.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.issupported
     */
    static IsSupported() {
        if (!DataTransferManager.HasProp("__IDataTransferManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DataTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTransferManagerStatics2.IID)
            DataTransferManager.__IDataTransferManagerStatics2 := IDataTransferManagerStatics2(factoryPtr)
        }

        return DataTransferManager.__IDataTransferManagerStatics2.IsSupported()
    }

    /**
     * Programmatically initiates the user interface for sharing content with another app.
     * 
     * This API is for Universal Windows Platform (UWP) apps. The alternative API to use for a desktop app is described in [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#for-classes-that-implement-idatatransfermanagerinterop).
     * @remarks
     * A [DataPackage](datapackage.md) must have its [Title](datapackagepropertyset_title.md) set in order to be shared. Ensure [Title](datapackagepropertyset_title.md) is set before calling this method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.showshareui
     */
    static ShowShareUI() {
        if (!DataTransferManager.HasProp("__IDataTransferManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DataTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTransferManagerStatics.IID)
            DataTransferManager.__IDataTransferManagerStatics := IDataTransferManagerStatics(factoryPtr)
        }

        return DataTransferManager.__IDataTransferManagerStatics.ShowShareUI()
    }

    /**
     * Returns the [DataTransferManager](datatransfermanager.md) object associated with the current window.
     * @remarks
     * Each window has a [DataTransferManager](datatransfermanager.md) object associated with it. When sharing content, you use the **GetForCurrentView** method to get the [DataTransferManager](datatransfermanager.md) object that is associated with the active window. After you have the appropriate [DataTransferManager](datatransfermanager.md) object, you can add an event listener to it to handle the [DataRequested](datatransfermanager_datarequested.md) event, which the system fires when a share operation is initiated. Your app uses the [DataRequest](datarequest.md) object returned with this event to set the data that the user wants to share with a target app.
     * @returns {DataTransferManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!DataTransferManager.HasProp("__IDataTransferManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DataTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTransferManagerStatics.IID)
            DataTransferManager.__IDataTransferManagerStatics := IDataTransferManagerStatics(factoryPtr)
        }

        return DataTransferManager.__IDataTransferManagerStatics.GetForCurrentView()
    }

    /**
     * Programmatically initiates the user interface for sharing content with another app.
     * 
     * This API is for Universal Windows Platform (UWP) apps. The alternative API to use for a desktop app is described in [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#for-classes-that-implement-idatatransfermanagerinterop).
     * @remarks
     * We recommend that you provide the user a Share affordance only when there is something shareable in your app. The prominence of the affordance can vary based on the nature of the content. For example, if the user gets a high score in a game, you may wish to put a Share button next to the congratulatory message. A news app, on the other hand, may put a Share button in an AppBar.
     * 
     * A [DataPackage](datapackage.md) must have its [Title](datapackagepropertyset_title.md) set in order to be shared. Ensure [Title](datapackagepropertyset_title.md) is set before calling this method.
     * @param {ShareUIOptions} options The options.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager.showshareui
     */
    static ShowShareUIWithOptions(options) {
        if (!DataTransferManager.HasProp("__IDataTransferManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.DataTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDataTransferManagerStatics3.IID)
            DataTransferManager.__IDataTransferManagerStatics3 := IDataTransferManagerStatics3(factoryPtr)
        }

        return DataTransferManager.__IDataTransferManagerStatics3.ShowShareUIWithOptions(options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataRequestedToken")) {
            this.remove_DataRequested(this.__OnDataRequestedToken)
            this.__OnDataRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTargetApplicationChosenToken")) {
            this.remove_TargetApplicationChosen(this.__OnTargetApplicationChosenToken)
            this.__OnTargetApplicationChosen.iface.Dispose()
        }

        if(this.HasProp("__OnShareProvidersRequestedToken")) {
            this.remove_ShareProvidersRequested(this.__OnShareProvidersRequestedToken)
            this.__OnShareProvidersRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<DataTransferManager, DataRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataRequested(handler) {
        if (!this.HasProp("__IDataTransferManager")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager := IDataTransferManager(outPtr)
        }

        return this.__IDataTransferManager.add_DataRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataRequested(token) {
        if (!this.HasProp("__IDataTransferManager")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager := IDataTransferManager(outPtr)
        }

        return this.__IDataTransferManager.remove_DataRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DataTransferManager, TargetApplicationChosenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetApplicationChosen(handler) {
        if (!this.HasProp("__IDataTransferManager")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager := IDataTransferManager(outPtr)
        }

        return this.__IDataTransferManager.add_TargetApplicationChosen(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TargetApplicationChosen(token) {
        if (!this.HasProp("__IDataTransferManager")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager := IDataTransferManager(outPtr)
        }

        return this.__IDataTransferManager.remove_TargetApplicationChosen(token)
    }

    /**
     * 
     * @param {TypedEventHandler<DataTransferManager, ShareProvidersRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShareProvidersRequested(handler) {
        if (!this.HasProp("__IDataTransferManager2")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager2 := IDataTransferManager2(outPtr)
        }

        return this.__IDataTransferManager2.add_ShareProvidersRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShareProvidersRequested(token) {
        if (!this.HasProp("__IDataTransferManager2")) {
            if ((queryResult := this.QueryInterface(IDataTransferManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataTransferManager2 := IDataTransferManager2(outPtr)
        }

        return this.__IDataTransferManager2.remove_ShareProvidersRequested(token)
    }

;@endregion Instance Methods
}
