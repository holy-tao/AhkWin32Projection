#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies decode options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicdecodeoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICDecodeOptions extends Win32Enum {

    /**
     * Cache metadata when needed.
     * Native name: WICDecodeMetadataCacheOnDemand
     * @type {Integer (Int32)}
     */
    static MetadataCacheOnDemand => 0

    /**
     * Cache metadata when decoder is loaded.
     * Native name: WICDecodeMetadataCacheOnLoad
     * @type {Integer (Int32)}
     */
    static MetadataCacheOnLoad => 1
}
