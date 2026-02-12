#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the interaction source represents the user's left hand or right hand.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcehandedness
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceHandedness extends Win32Enum{

    /**
     * The interaction source does not represent a specific hand.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The interaction source represents the user's left hand.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * The interaction source represents the user's right hand.
     * @type {Integer (Int32)}
     */
    static Right => 2
}
