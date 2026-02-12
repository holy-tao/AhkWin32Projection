#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVp9ProfileIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting HEVC profile IDs.
 * @remarks
 * You can set the value of [VideoEncodingProperties.ProfileId](videoencodingproperties_profileid.md) to one of the profile ids provided by this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.vp9profileids
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class Vp9ProfileIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the ID for the VP9 profile 0 with with 4:2:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.vp9profileids.profile0chromasubsampling420bitdepth8
     * @type {Integer} 
     */
    static Profile0ChromaSubsampling420BitDepth8 {
        get => Vp9ProfileIds.get_Profile0ChromaSubsampling420BitDepth8()
    }

    /**
     * Gets the ID for the VP9 profile 2 with with 4:2:0 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.vp9profileids.profile2chromasubsampling420bitdepth10
     * @type {Integer} 
     */
    static Profile2ChromaSubsampling420BitDepth10 {
        get => Vp9ProfileIds.get_Profile2ChromaSubsampling420BitDepth10()
    }

    /**
     * Gets the ID for the VP9 profile 2 with with 4:2:0 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.vp9profileids.profile2chromasubsampling420bitdepth12
     * @type {Integer} 
     */
    static Profile2ChromaSubsampling420BitDepth12 {
        get => Vp9ProfileIds.get_Profile2ChromaSubsampling420BitDepth12()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Profile0ChromaSubsampling420BitDepth8() {
        if (!Vp9ProfileIds.HasProp("__IVp9ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Vp9ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVp9ProfileIdsStatics.IID)
            Vp9ProfileIds.__IVp9ProfileIdsStatics := IVp9ProfileIdsStatics(factoryPtr)
        }

        return Vp9ProfileIds.__IVp9ProfileIdsStatics.get_Profile0ChromaSubsampling420BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Profile2ChromaSubsampling420BitDepth10() {
        if (!Vp9ProfileIds.HasProp("__IVp9ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Vp9ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVp9ProfileIdsStatics.IID)
            Vp9ProfileIds.__IVp9ProfileIdsStatics := IVp9ProfileIdsStatics(factoryPtr)
        }

        return Vp9ProfileIds.__IVp9ProfileIdsStatics.get_Profile2ChromaSubsampling420BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Profile2ChromaSubsampling420BitDepth12() {
        if (!Vp9ProfileIds.HasProp("__IVp9ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Vp9ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVp9ProfileIdsStatics.IID)
            Vp9ProfileIds.__IVp9ProfileIdsStatics := IVp9ProfileIdsStatics(factoryPtr)
        }

        return Vp9ProfileIds.__IVp9ProfileIdsStatics.get_Profile2ChromaSubsampling420BitDepth12()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
