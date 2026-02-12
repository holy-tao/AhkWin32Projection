#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorAuthenticationTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task on behalf of a companion device.
 * @remarks
 * A companion device acts in conjunction with your Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) or Windows 10 Mobile device to enhance the user authentication experience. For instance, a user may attach their companion device to PC via USB, touch the fingerprint reader on the companion device, which automatically unlocks their PC.
 * 
 * When the companion device app registers the first companion device, it should also register its background task component which will pass authentication information between device and companion device authentication service.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.secondaryauthenticationfactorauthenticationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorAuthenticationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorAuthenticationTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SecondaryAuthenticationFactorAuthenticationTrigger](secondaryauthenticationfactorauthenticationtrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SecondaryAuthenticationFactorAuthenticationTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
