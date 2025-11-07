#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for the IPlayToSourceClassFactory::CreateInstance method.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/ne-mfsharingengine-playto_source_createflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PLAYTO_SOURCE_CREATEFLAGS{

    /**
     * 
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
