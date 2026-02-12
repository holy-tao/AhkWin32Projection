#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger to activate a communication blocking application when it is selected as the preferred blocking app.
  * 
  * A user can have multiple communication blocking applications installed at one time. This trigger is used to let an application know that it has been selected as the active communication blocking application. For more information about the communication blocking API, see [Windows.ApplicationModel.CommunicationBlocking](../windows.applicationmodel.communicationblocking/windows_applicationmodel_communicationblocking.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.communicationblockingappsetasactivetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class CommunicationBlockingAppSetAsActiveTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CommunicationBlockingAppSetAsActiveTrigger](communicationblockingappsetasactivetrigger.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.CommunicationBlockingAppSetAsActiveTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
