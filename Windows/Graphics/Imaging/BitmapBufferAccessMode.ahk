#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the access mode of a [BitmapBuffer](bitmapbuffer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapbufferaccessmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapBufferAccessMode extends Win32Enum{

    /**
     * The buffer is read-only.
     * @type {Integer (Int32)}
     */
    static Read => 0

    /**
     * The buffer can be read from and written to.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 1

    /**
     * The buffer is write-only.
     * @type {Integer (Int32)}
     */
    static Write => 2
}
