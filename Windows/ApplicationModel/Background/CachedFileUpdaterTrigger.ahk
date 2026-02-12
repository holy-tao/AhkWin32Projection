#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICachedFileUpdaterTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task to enable the Cached File Updater contract.
 * @remarks
 * On the phone form factor, apps can't be launched without showing UI. This class enables phone apps to use a background task to update cached files.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.cachedfileupdatertrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class CachedFileUpdaterTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICachedFileUpdaterTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICachedFileUpdaterTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CachedFileUpdaterTrigger](cachedfileupdatertrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.CachedFileUpdaterTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
