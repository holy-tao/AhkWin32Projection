#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies decode options.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicdecodeoptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICDecodeOptions extends Win32Enum{

    /**
     * Cache metadata when needed.
     * @type {Integer (Int32)}
     */
    static WICDecodeMetadataCacheOnDemand => 0

    /**
     * Cache metadata when decoder is loaded.
     * @type {Integer (Int32)}
     */
    static WICDecodeMetadataCacheOnLoad => 1
}
