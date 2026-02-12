#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationErrorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an error encountered during a Syndication operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationerror
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationError extends IInspectable {
;@region Static Methods
    /**
     * Gets the specific error using the returned **HRESULT** value. Possible values are defined by [SyndicationErrorStatus](syndicationerrorstatus.md).
     * @param {Integer} hresult_ An **HRESULT** returned during the operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationerror.getstatus
     */
    static GetStatus(hresult_) {
        if (!SyndicationError.HasProp("__ISyndicationErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationErrorStatics.IID)
            SyndicationError.__ISyndicationErrorStatics := ISyndicationErrorStatics(factoryPtr)
        }

        return SyndicationError.__ISyndicationErrorStatics.GetStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
