#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of an interaction source.
 * @remarks
 * This only enumerates sources of interactions, such as hand gestures and voice commands. The user's head gaze is used for pointing and is represented separately by the [SpatialPointerPose](spatialpointerpose.md) type.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourcekind
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceKind extends Win32Enum{

    /**
     * The interaction source is of a kind not known in this version of the API.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * The interaction source is one of the user's hands.
     * @type {Integer (Int32)}
     */
    static Hand => 1

    /**
     * The interaction source is the user's speech, when speaking a system command such as "Select".
     * @type {Integer (Int32)}
     */
    static Voice => 2

    /**
     * The interaction source is a motion controller.
     * @type {Integer (Int32)}
     */
    static Controller => 3
}
