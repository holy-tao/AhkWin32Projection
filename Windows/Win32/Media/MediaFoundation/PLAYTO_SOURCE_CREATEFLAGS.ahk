#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags for the IPlayToSourceClassFactory::CreateInstance method.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ne-mfsharingengine-playto_source_createflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class PLAYTO_SOURCE_CREATEFLAGS extends Win32BitflagEnum {

    /**
     * Native name: PLAYTO_SOURCE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Share images.
     * Native name: PLAYTO_SOURCE_IMAGE
     * @type {Integer (Int32)}
     */
    static IMAGE => 1

    /**
     * Share audio.
     * Native name: PLAYTO_SOURCE_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 2

    /**
     * Share video.
     * Native name: PLAYTO_SOURCE_VIDEO
     * @type {Integer (Int32)}
     */
    static VIDEO => 4

    /**
     * Share DRM protected media.
     * 
     * Supported in Windows 8.1 and later.
     * Native name: PLAYTO_SOURCE_PROTECTED
     * @type {Integer (Int32)}
     */
    static PROTECTED => 8
}
