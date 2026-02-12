#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSourceClosedRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object to be used by the [MediaStreamSource.closed](mediastreamsource_closed.md) event to provide information to the application.
 * @remarks
 * The [Reason](mediastreamsourceclosedreason.md) property provides information regrading why the [MediaStreamSource](mediastreamsource.md) was closed.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceclosedrequest
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSourceClosedRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSourceClosedRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSourceClosedRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason why the media stream source was closed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsourceclosedrequest.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_Reason() {
        if (!this.HasProp("__IMediaStreamSourceClosedRequest")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSourceClosedRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSourceClosedRequest := IMediaStreamSourceClosedRequest(outPtr)
        }

        return this.__IMediaStreamSourceClosedRequest.get_Reason()
    }

;@endregion Instance Methods
}
