#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\POINT.ahk

/**
 * Contains the rank of an object as the probable target of the touch contact area.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreproximityevaluation
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreProximityEvaluation extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Rank of an object as the probable target compared to the other objects that intersect the touch contact area. The value is a [CoreProximityEvaluationScore](coreproximityevaluationscore.md).
     * @type {Integer}
     */
    Score {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Adjusted touch point that hits the closest object identified by the value of **Score**.
     * @type {POINT}
     */
    AdjustedPoint{
        get {
            if(!this.HasProp("__AdjustedPoint"))
                this.__AdjustedPoint := POINT(4, this)
            return this.__AdjustedPoint
        }
    }
}
