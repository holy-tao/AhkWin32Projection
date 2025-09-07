#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * AUTO_SCROLL_DATA may be altered or unavailable.
 * @remarks
 * NUM_POINTS is currently set to <c>3</c>.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-auto_scroll_data
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AUTO_SCROLL_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 1

    /**
     * Type: <b>int</b>
     * 
     * A value that indicates the number of times the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-dad_autoscroll">DAD_AutoScroll</a> function has stored data in the structure. The parameter is reset to <c>0</c> after it equals 2.
     * @type {Integer}
     */
    iNextSample {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> that indicates the time of the last scroll. The scroll time is also stored in the <b>dwTimes</b> parameter indexed by the current value of <b>iNextSample</b>.
     * @type {Integer}
     */
    dwLastScroll {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that is used to determine whether the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-dad_autoscroll">DAD_AutoScroll</a> function should succeed. This parameter is set to <b>TRUE</b> when the <b>iNextSample</b> parameter is equal to NUM_POINTS.
     * @type {Integer}
     */
    bFull {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>[NUM_POINTS]</b>
     * 
     * A pointer to the current scroll coordinates. The index of this array is <b>iNextSample</b>.
     * @type {Array<POINT>}
     */
    pts{
        get {
            if(!this.HasProp("__ptsProxyArray"))
                this.__ptsProxyArray := Win32FixedArray(this.ptr + 12, 8, POINT, "")
            return this.__ptsProxyArray
        }
    }

    /**
     * Type: <b>DWORD[NUM_POINTS]</b>
     * 
     * A <b>DWORD</b> that indicates the current scroll time. The index of this array is <b>iNextSample</b>.
     * @type {Array<UInt32>}
     */
    dwTimes{
        get {
            if(!this.HasProp("__dwTimesProxyArray"))
                this.__dwTimesProxyArray := Win32FixedArray(this.ptr + 36, 4, Primitive, "uint")
            return this.__dwTimesProxyArray
        }
    }
}
