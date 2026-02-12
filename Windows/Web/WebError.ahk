#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebErrorStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides error status resulting from a web service operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.weberror
 * @namespace Windows.Web
 * @version WindowsRuntime 1.4
 */
class WebError extends IInspectable {
;@region Static Methods
    /**
     * Gets a [WebErrorStatus](weberrorstatus.md) value based on an error encountered by a web service operation.
     * @param {Integer} hresult_ The error encountered by a web service operation represented as an **hResult**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.weberror.getstatus
     */
    static GetStatus(hresult_) {
        if (!WebError.HasProp("__IWebErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.WebError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebErrorStatics.IID)
            WebError.__IWebErrorStatics := IWebErrorStatics(factoryPtr)
        }

        return WebError.__IWebErrorStatics.GetStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
