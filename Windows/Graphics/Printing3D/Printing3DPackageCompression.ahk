#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the intended file compression level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dpackagecompression
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DPackageCompression extends Win32Enum{

    /**
     * Low file compression. This results in faster in-memory processing.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Medium file compression. This is the default value.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * High file compression. This is recommended to reduce the size of the 3MF package before saving it to disk or sending it over the network.
     * @type {Integer (Int32)}
     */
    static High => 2
}
