#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Apis.ahk" { DestroyAlternate }

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
 */
export default struct HRECOALT {
    Value : IntPtr

    __value {
        set {
            if (value is HRECOALT) {
                this.Value := value.Value
            }
            else {
                this.Value := value
            }
        }
    }

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    __New(Value := -1) {
        this.Value := Value
    }

    Free() {
        ; Do nothing if the handle is invalid already
        if (this.Value != -1 && this.Value != 0) {
            DestroyAlternate(this.Value)
            this.Value := -1
        }
    }

    /**
     * A `HRECOALT` which is owned by the script and which frees itself
     * in `__Delete`.
     */
    struct Owned extends HRECOALT {
        __Delete() {
            this.Free()
        }
    }

    /**
     * Takes ownership of this HRECOALT, returning an owned handle that frees
     * itself when it falls out of scope. This is a *move*: the original handle is
     * invalidated so the underlying resource has exactly one owner.
     * @returns {HRECOALT.Owned}
     */
    Adopt() {
        if (this is HRECOALT.Owned) {
            throw TypeError("Cannot adopt an owned HRECOALT", -1)
        }
        owned := HRECOALT.Owned(this.Value)
        this.Value := -1
        return owned
    }
}
