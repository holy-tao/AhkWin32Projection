#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags for the IPlayToSourceClassFactory::CreateInstance method.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ne-mfsharingengine-playto_source_createflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PLAYTO_SOURCE_CREATEFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PLAYTO_SOURCE_NONE => 0

    /**
     * Share images.
     * @type {Integer (Int32)}
     */
    static PLAYTO_SOURCE_IMAGE => 1

    /**
     * Share audio.
     * @type {Integer (Int32)}
     */
    static PLAYTO_SOURCE_AUDIO => 2

    /**
     * Share video.
     * @type {Integer (Int32)}
     */
    static PLAYTO_SOURCE_VIDEO => 4

    /**
     * Share DRM protected media.
     * 
     * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static PLAYTO_SOURCE_PROTECTED => 8
}
