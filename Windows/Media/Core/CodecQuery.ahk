#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICodecQuery.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the [FindAllAsync](./codecquery_findallasync_1027997915.md) method which allows you to enumerate all media codecs installed on the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecquery
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class CodecQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICodecQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICodecQuery.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **CodecQuery** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecQuery")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Returns a read-only list of all media codecs installed on the system that meet the specified requirements.
     * @param {Integer} kind A value that specifies whether the method should return codecs that operate on video or audio data.
     * @param {Integer} category A value that specifies whether the method should return codecs that are encoders or decoders.
     * @param {HSTRING} subType A value specifying the media encoding subtype that all returned codecs must support. This value can be a string representation of one of the subtype GUIDs listed in [Audio Subtype GUIDs](/windows/desktop/medfound/audio-subtype-guids) or [Video Subtyp GUIDs](/windows/desktop/medfound/video-subtype-guids). The [CodecSubtypes](./codecsubtypes.md) class provides properties for most supported media subtypes that return the string representation of the subtype [GUID](/windows/win32/api/guiddef/ns-guiddef-guid). You can also specify a FOURCC code for this parameter. For more information, see [FOURCC Codes](/windows/desktop/DirectShow/fourcc-codes). To specify that all codecs of the specified *kind* and *category* should be returned, regardless of what media subtypes are supported, specify an empty string ("") for this parameter.
     * @returns {IAsyncOperation<IVectorView<CodecInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecquery.findallasync
     */
    FindAllAsync(kind, category, subType) {
        if (!this.HasProp("__ICodecQuery")) {
            if ((queryResult := this.QueryInterface(ICodecQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICodecQuery := ICodecQuery(outPtr)
        }

        return this.__ICodecQuery.FindAllAsync(kind, category, subType)
    }

;@endregion Instance Methods
}
