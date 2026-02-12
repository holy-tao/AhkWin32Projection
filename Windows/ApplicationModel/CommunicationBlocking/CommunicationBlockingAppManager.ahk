#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICommunicationBlockingAppManagerStatics.ahk
#Include .\ICommunicationBlockingAppManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Determines the application to use as a blocking application.
 * @remarks
 * A user can install multiple applications that are capable of filtering messages and calls. However, only one of these blocking applications can be active at a time. This class is used to determine the active blocking application.
 * 
 * When an application is selected to be the active call blocking app, it will be notified by [CommunicationBlockingAppSetAsActiveTrigger](../windows.applicationmodel.background/communicationblockingappsetasactivetrigger.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingappmanager
 * @namespace Windows.ApplicationModel.CommunicationBlocking
 * @version WindowsRuntime 1.4
 */
class CommunicationBlockingAppManager extends IInspectable {
;@region Static Properties
    /**
     * Indicates whether the current application is the active blocking application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingappmanager.iscurrentappactiveblockingapp
     * @type {Boolean} 
     */
    static IsCurrentAppActiveBlockingApp {
        get => CommunicationBlockingAppManager.get_IsCurrentAppActiveBlockingApp()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsCurrentAppActiveBlockingApp() {
        if (!CommunicationBlockingAppManager.HasProp("__ICommunicationBlockingAppManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAppManagerStatics.IID)
            CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics := ICommunicationBlockingAppManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics.get_IsCurrentAppActiveBlockingApp()
    }

    /**
     * Displays the UI to select the currently active blocking application.
     * @remarks
     * Multiple call blocking applications can be installed on a single device. However, only one of these apps can be active at a time. The only way to switch the currently active app is to call ShowCommunicationBlockingSettingsUI and let the user select which app should be active.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingappmanager.showcommunicationblockingsettingsui
     */
    static ShowCommunicationBlockingSettingsUI() {
        if (!CommunicationBlockingAppManager.HasProp("__ICommunicationBlockingAppManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAppManagerStatics.IID)
            CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics := ICommunicationBlockingAppManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics.ShowCommunicationBlockingSettingsUI()
    }

    /**
     * Calls a dialog to set the current app as the default phone communication blocking application.
     * @remarks
     * In order to use this API, your application needs to be registered as a communication blocking provider. If the application is not appropriately registered, this API will throw an exception. See [Windows.ApplicationModel.CommunicationBlocking](windows_applicationmodel_communicationblocking.md) for more information about how to register as a phone call origin provider.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingappmanager.requestsetasactiveblockingappasync
     */
    static RequestSetAsActiveBlockingAppAsync() {
        if (!CommunicationBlockingAppManager.HasProp("__ICommunicationBlockingAppManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAppManagerStatics2.IID)
            CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics2 := ICommunicationBlockingAppManagerStatics2(factoryPtr)
        }

        return CommunicationBlockingAppManager.__ICommunicationBlockingAppManagerStatics2.RequestSetAsActiveBlockingAppAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
