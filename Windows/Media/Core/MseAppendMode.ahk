#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how a [MseSourceBuffer](msesourcebuffer.md) object appends a buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mseappendmode
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseAppendMode extends Win32Enum{

    /**
     * Append in segments.
     * @type {Integer (Int32)}
     */
    static Segments => 0

    /**
     * Append sequentially.
     * @type {Integer (Int32)}
     */
    static Sequence => 1
}
