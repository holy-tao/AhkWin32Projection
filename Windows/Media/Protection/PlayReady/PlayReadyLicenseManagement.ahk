#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyLicenseManagement.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Performs license management operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensemanagement
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyLicenseManagement extends IInspectable {
;@region Static Methods
    /**
     * Deletes licenses that match the specified content header.
     * @remarks
     * Any licenses deleted by this method will have to be reacquired from the license server if the client wants to play back their associated content.
     * @param {PlayReadyContentHeader} contentHeader Content header with a key identifier with which to match licenses.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicensemanagement.deletelicenses
     */
    static DeleteLicenses(contentHeader) {
        if (!PlayReadyLicenseManagement.HasProp("__IPlayReadyLicenseManagement")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyLicenseManagement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyLicenseManagement.IID)
            PlayReadyLicenseManagement.__IPlayReadyLicenseManagement := IPlayReadyLicenseManagement(factoryPtr)
        }

        return PlayReadyLicenseManagement.__IPlayReadyLicenseManagement.DeleteLicenses(contentHeader)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
