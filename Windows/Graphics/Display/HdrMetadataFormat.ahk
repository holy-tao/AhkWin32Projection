#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the HDR metadata format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.hdrmetadataformat
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class HdrMetadataFormat extends Win32Enum{

    /**
     * The specified display supports the HDR10 style metadata, as per the HDR10 specification.
     * @type {Integer (Int32)}
     */
    static Hdr10 => 0

    /**
     * The specified display supports the HDR10Plus style of metadata, as per the HDR10Plus specification.
     * @type {Integer (Int32)}
     */
    static Hdr10Plus => 1
}
