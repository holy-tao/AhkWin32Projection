#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemAudioProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [Windows audio file properties](/windows/desktop/properties/audio-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemaudioproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemAudioProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemAudioProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemAudioProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Audio.EncodingBitrate](/windows/desktop/properties/props-system-audio-encodingbitrate) property (one of the [Windows audio file properties](/windows/desktop/properties/audio-bumper)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemaudioproperties.encodingbitrate
     * @type {HSTRING} 
     */
    EncodingBitrate {
        get => this.get_EncodingBitrate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EncodingBitrate() {
        if (!this.HasProp("__ISystemAudioProperties")) {
            if ((queryResult := this.QueryInterface(ISystemAudioProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemAudioProperties := ISystemAudioProperties(outPtr)
        }

        return this.__ISystemAudioProperties.get_EncodingBitrate()
    }

;@endregion Instance Methods
}
