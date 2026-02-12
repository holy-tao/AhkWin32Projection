#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains the distance thresholds for a [CrossSliding](gesturerecognizer_crosssliding.md) interaction.
 * @remarks
 * A speed bump is a [CrossSliding](gesturerecognizer_crosssliding.md) region in which the user experiences a slight drag (or friction) during the [swipe](/windows/uwp/input-and-devices/guidelines-for-cross-slide) or [slide](/windows/uwp/input-and-devices/guidelines-for-cross-slide) gesture.
 * 
 * The following diagram shows the [CrossSliding](gesturerecognizer_crosssliding.md) regions and thresholds. The areas highlighted in blue are the selection/speed bump regions. (The region on the left shows the distance the tile must travel while the region on the right shows the equivalent distance that the touch contact must travel due to the speed bump behavior).
 * 
 * <img src="images/crossslide_threshold2.png" width="592" height="282" alt="Screen shot showing CrossSlide regions and distance thresholds." />
 * 
 * To disable a threshold, set its value to 0.0.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidethresholds
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class CrossSlideThresholds extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The distance, in device-independent pixel (DIP), from the initial point of contact until the selection action is initiated.
     * @type {Float}
     */
    SelectionStart {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The distance, in device-independent pixel (DIP), from the initial point of contact until the speed bump is initiated.
     * @type {Float}
     */
    SpeedBumpStart {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The distance, in device-independent pixel (DIP), from the initial point of contact until the end of the speed bump.
     * @type {Float}
     */
    SpeedBumpEnd {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The distance, in device-independent pixel (DIP), from the initial point of contact until the rearrange action is initiated.
     * @type {Float}
     */
    RearrangeStart {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
