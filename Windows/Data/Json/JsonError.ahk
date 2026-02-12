#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IJsonErrorStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an error encountered while parsing JSON data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonerror
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonError extends IInspectable {
;@region Static Methods
    /**
     * Gets the specific error using the returned **HRESULT** value. Possible values are defined by [JsonErrorStatus](jsonerrorstatus.md).
     * @param {Integer} hresult_ An **HRESULT** returned during the operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonerror.getjsonstatus
     */
    static GetJsonStatus(hresult_) {
        if (!JsonError.HasProp("__IJsonErrorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Data.Json.JsonError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJsonErrorStatics2.IID)
            JsonError.__IJsonErrorStatics2 := IJsonErrorStatics2(factoryPtr)
        }

        return JsonError.__IJsonErrorStatics2.GetJsonStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
