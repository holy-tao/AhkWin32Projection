#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingSource.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the media content that can be sent to another device.
 * @remarks
 * You can obtain this object from a [MediaPlayer](../windows.media.playback/mediaplayer.md), [Image](../windows.ui.xaml.controls/image.md), or HTML Tag by calling the respective [GetAsCastingSource](../windows.media.playback/mediaplayer_getascastingsource_1958734275.md) method. In the current release, apps should use **MediaPlayer** and [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md) for media playback, but the legacy [MediaElement](../windows.ui.xaml.controls/mediaelement.md) control also provides a [GetAsCastingSource](../windows.ui.xaml.controls/mediaelement_getascastingsource_1958734275.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingsource
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingSource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets an alternative URI for the content for use with DLNA ByRef.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingsource.preferredsourceuri
     * @type {Uri} 
     */
    PreferredSourceUri {
        get => this.get_PreferredSourceUri()
        set => this.put_PreferredSourceUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PreferredSourceUri() {
        if (!this.HasProp("__ICastingSource")) {
            if ((queryResult := this.QueryInterface(ICastingSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingSource := ICastingSource(outPtr)
        }

        return this.__ICastingSource.get_PreferredSourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_PreferredSourceUri(value) {
        if (!this.HasProp("__ICastingSource")) {
            if ((queryResult := this.QueryInterface(ICastingSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingSource := ICastingSource(outPtr)
        }

        return this.__ICastingSource.put_PreferredSourceUri(value)
    }

;@endregion Instance Methods
}
