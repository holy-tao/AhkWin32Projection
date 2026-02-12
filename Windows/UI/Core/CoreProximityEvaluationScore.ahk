#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the rank of an object as the probable target, relative to other objects that intersect the touch contact area.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreproximityevaluationscore
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreProximityEvaluationScore extends Win32Enum{

    /**
     * The object is the most probable target.
     * @type {Integer (Int32)}
     */
    static Closest => 0

    /**
     * The object is the least probable target.
     * @type {Integer (Int32)}
     */
    static Farthest => 2147483647
}
