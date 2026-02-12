#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyContentResolver.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Receives multiple service request objects that are necessary to enable the playback ability for a given content header.
 * @remarks
 * There are multiple operations that may need to be performed before playback can occur for a given content header. For example, individualization, domain join, and license acquisition may all be required (and multiple attempts of each could occur). If licenses are already present, the content resolver will try to enable the first license that is found rather than making a deterministic choice or allowing the app to choose.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentresolver
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyContentResolver extends IInspectable {
;@region Static Methods
    /**
     * Proactively initiates the service request chain for a given content header.
     * @remarks
     * **NULL** is a valid successful response if the content header is already viable for playback.
     * @param {PlayReadyContentHeader} contentHeader Content header for the content the app wants to resolve all necessary service request operations.
     * @returns {IPlayReadyServiceRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentresolver.servicerequest
     */
    static ServiceRequest(contentHeader) {
        if (!PlayReadyContentResolver.HasProp("__IPlayReadyContentResolver")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyContentResolver")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyContentResolver.IID)
            PlayReadyContentResolver.__IPlayReadyContentResolver := IPlayReadyContentResolver(factoryPtr)
        }

        return PlayReadyContentResolver.__IPlayReadyContentResolver.ServiceRequest(contentHeader)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
