#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICodecInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a media codec that is installed on the system.
 * @remarks
 * Get an instance of this class by calling [CodecQuery.FindAllAsync](./codecquery_findallasync_1027997915.md), which returns a list of all installed codecs that meet the specified criteria.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class CodecInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICodecInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICodecInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying whether the codec operates on audio or video data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets a value that specifies whether the codec is an encoder or a decoder.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets a read-only list of values that specify the media subtypes supported by the codec.
     * @remarks
     * Each value in the list returned by this method is string representation of a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies a media subtype that is supported by the codec. For a listing of media subtype GUIDs, see [Audio Subtype GUIDs](/windows/desktop/medfound/audio-subtype-guids) or [Video Subtyp GUIDs](/windows/desktop/medfound/video-subtype-guids). The [CodecSubtypes](./codecsubtypes.md) class provides properties for most supported media subtypes that return the string representation of the subtype GUID to make it easy to compare against the **Subtypes** property of a **CodecInfo** object to see if a codec supports a particular subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo.subtypes
     * @type {IVectorView<HSTRING>} 
     */
    Subtypes {
        get => this.get_Subtypes()
    }

    /**
     * Gets the friendly display name for the codec.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a value that indicates whether the codec runs in your app's process space rather than in a separate app service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecinfo.istrusted
     * @type {Boolean} 
     */
    IsTrusted {
        get => this.get_IsTrusted()
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
    get_Kind() {
        if (!this.HasProp("__ICodecInfo")) {
            if ((queryResult := this.QueryInterface(ICodecInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecInfo := ICodecInfo(outPtr)
        }

        return this.__ICodecInfo.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        if (!this.HasProp("__ICodecInfo")) {
            if ((queryResult := this.QueryInterface(ICodecInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecInfo := ICodecInfo(outPtr)
        }

        return this.__ICodecInfo.get_Category()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Subtypes() {
        if (!this.HasProp("__ICodecInfo")) {
            if ((queryResult := this.QueryInterface(ICodecInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecInfo := ICodecInfo(outPtr)
        }

        return this.__ICodecInfo.get_Subtypes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ICodecInfo")) {
            if ((queryResult := this.QueryInterface(ICodecInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecInfo := ICodecInfo(outPtr)
        }

        return this.__ICodecInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrusted() {
        if (!this.HasProp("__ICodecInfo")) {
            if ((queryResult := this.QueryInterface(ICodecInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecInfo := ICodecInfo(outPtr)
        }

        return this.__ICodecInfo.get_IsTrusted()
    }

;@endregion Instance Methods
}
