#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISetDefaultSpatialAudioFormatResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to set a default spatial audio format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.setdefaultspatialaudioformatresult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SetDefaultSpatialAudioFormatResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetDefaultSpatialAudioFormatResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetDefaultSpatialAudioFormatResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the status of the result, whether it failed (and why) or succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.setdefaultspatialaudioformatresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ISetDefaultSpatialAudioFormatResult")) {
            if ((queryResult := this.QueryInterface(ISetDefaultSpatialAudioFormatResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetDefaultSpatialAudioFormatResult := ISetDefaultSpatialAudioFormatResult(outPtr)
        }

        return this.__ISetDefaultSpatialAudioFormatResult.get_Status()
    }

;@endregion Instance Methods
}
