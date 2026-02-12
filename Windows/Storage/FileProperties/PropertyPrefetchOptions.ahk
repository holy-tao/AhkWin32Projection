#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates a system-defined group of file properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.propertyprefetchoptions
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class PropertyPrefetchOptions extends Win32BitflagEnum{

    /**
     * No specific, system-defined property group.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * A group of music-related properties that can be access through a [MusicProperties](musicproperties.md) object.
     * @type {Integer (UInt32)}
     */
    static MusicProperties => 1

    /**
     * A group of video-related properties that can be access through a [VideoProperties](videoproperties.md) object.
     * @type {Integer (UInt32)}
     */
    static VideoProperties => 2

    /**
     * A group of image-related properties that can be access through a [ImageProperties](imageproperties.md) object.
     * @type {Integer (UInt32)}
     */
    static ImageProperties => 4

    /**
     * A group of document-related properties that can be access through a [DocumentProperties](documentproperties.md) object.
     * @type {Integer (UInt32)}
     */
    static DocumentProperties => 8

    /**
     * A group of basic properties that can be access through a [BasicProperties](basicproperties.md) object.
     * @type {Integer (UInt32)}
     */
    static BasicProperties => 16
}
