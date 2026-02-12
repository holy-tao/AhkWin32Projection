#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the unique identifiers of all nodes belonging to the InkAnalysisInkBullet object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.analysis.inkanalysisinkbullet.getstrokeids
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class Ink extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
