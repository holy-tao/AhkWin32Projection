#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the ready state of a [MseStreamSource](msestreamsource.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.msereadystate
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseReadyState extends Win32Enum{

    /**
     * The [MseStreamSource](msestreamsource.md) is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The [MseStreamSource](msestreamsource.md) is open.
     * @type {Integer (Int32)}
     */
    static Open => 1

    /**
     * The [MseStreamSource](msestreamsource.md) is ended.
     * @type {Integer (Int32)}
     */
    static Ended => 2
}
