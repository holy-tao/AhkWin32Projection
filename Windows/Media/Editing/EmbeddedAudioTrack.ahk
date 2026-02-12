#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmbeddedAudioTrack.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an audio track embedded in the media clip.
 * @remarks
 * Get an instance of this class by accessing the [MediaClip.EmbeddedAudioTracks](mediaclip_embeddedaudiotracks.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.embeddedaudiotrack
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class EmbeddedAudioTrack extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmbeddedAudioTrack

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmbeddedAudioTrack.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) for the embedded audio track.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.embeddedaudiotrack.getaudioencodingproperties
     */
    GetAudioEncodingProperties() {
        if (!this.HasProp("__IEmbeddedAudioTrack")) {
            if ((queryResult := this.QueryInterface(IEmbeddedAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmbeddedAudioTrack := IEmbeddedAudioTrack(outPtr)
        }

        return this.__IEmbeddedAudioTrack.GetAudioEncodingProperties()
    }

;@endregion Instance Methods
}
