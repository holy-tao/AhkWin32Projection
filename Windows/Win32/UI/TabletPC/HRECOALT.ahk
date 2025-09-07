#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HRECOALT handle is obsolete.
 * @remarks
 * These functions are obsolete and need not be implemented by custom application recognizers.
  * 
  * -   [**DestroyAlternate**](/windows/desktop/api/recapis/nf-recapis-destroyalternate)
  * -   [**GetConfidenceLevel**](/previous-versions/windows/desktop/legacy/ms704829(v=vs.85))
  * -   [**GetGuideIndex**](/previous-versions/windows/desktop/legacy/ms701152(v=vs.85))
  * -   [**GetMetrics**](/previous-versions/windows/desktop/legacy/ms695560(v=vs.85))
  * -   [**GetPropertyRanges**](/previous-versions/windows/desktop/legacy/ms695602(v=vs.85))
  * -   [**GetSegmentAlternateList**](/previous-versions/windows/desktop/legacy/ms701702(v=vs.85))
  * -   [**GetString**](/previous-versions/windows/desktop/legacy/ms704890(v=vs.85))
  * -   [**GetStrokeRanges**](/previous-versions/windows/desktop/legacy/ms705304(v=vs.85))
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecoalt-handle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class HRECOALT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
