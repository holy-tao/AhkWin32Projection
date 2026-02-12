#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a tethering event that triggers a background task to run.
 * @remarks
 * When this trigger is registered, and your cellular customer tries to turn on tethering through the Windows UI, the background task is triggered. As a mobile network operator, you can use the triggered background task to communicate to Windows whether your cellular customer is allowed to use the tethering feature based on their entitlement.
 * 
 * The background task will only be triggered if it is correctly registered in the Country and Operator Settings Asset (COSA) database for mobile operators. See [Desktop COSA/APN database settings](/windows-hardware/drivers/mobilebroadband/desktop-cosa-apn-database-settings#desktop-cosa-only-settings) for details.
 * 
 * > [!WARNING]
 * > The tethering trigger may not behave as expected if it is reregistered multiple times
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.tetheringentitlementchecktrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class TetheringEntitlementCheckTrigger extends IInspectable {
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
     * Creates and initializes a new instance of a tethering event trigger.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.TetheringEntitlementCheckTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
