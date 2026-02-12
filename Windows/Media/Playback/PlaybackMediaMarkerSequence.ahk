#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PlaybackMediaMarker.ahk
#Include .\IPlaybackMediaMarkerSequence.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\Guid.ahk

/**
 * An ordered collection of [PlaybackMediaMarker](playbackmediamarker.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkersequence
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class PlaybackMediaMarkerSequence extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaybackMediaMarkerSequence

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaybackMediaMarkerSequence.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the number of items in the sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkersequence.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
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
    get_Size() {
        if (!this.HasProp("__IPlaybackMediaMarkerSequence")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarkerSequence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarkerSequence := IPlaybackMediaMarkerSequence(outPtr)
        }

        return this.__IPlaybackMediaMarkerSequence.get_Size()
    }

    /**
     * Adds a [PlaybackMediaMarker](playbackmediamarker.md) to the sequence in its ordered position.
     * @param {PlaybackMediaMarker} value The media marker to insert into the sequence.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkersequence.insert
     */
    Insert(value) {
        if (!this.HasProp("__IPlaybackMediaMarkerSequence")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarkerSequence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarkerSequence := IPlaybackMediaMarkerSequence(outPtr)
        }

        return this.__IPlaybackMediaMarkerSequence.Insert(value)
    }

    /**
     * Removes all elements from the sequence.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkersequence.clear
     */
    Clear() {
        if (!this.HasProp("__IPlaybackMediaMarkerSequence")) {
            if ((queryResult := this.QueryInterface(IPlaybackMediaMarkerSequence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaybackMediaMarkerSequence := IPlaybackMediaMarkerSequence(outPtr)
        }

        return this.__IPlaybackMediaMarkerSequence.Clear()
    }

    /**
     * Gets an [IIterator](../windows.foundation.collections/iiterator_1.md) pointing at the first [PlaybackMediaMarker](playbackmediamarker.md) in the sequence.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.playbackmediamarkersequence.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{deeccfe9-6c01-576f-95f2-93515ae40ebf}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(PlaybackMediaMarker, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
