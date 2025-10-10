#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LVGROUP.ahk

/**
 * Used to sort groups. It is used with LVM_INSERTGROUPSORTED.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvinsertgroupsorted
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVINSERTGROUPSORTED extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * Type: <b>PFNLVGROUPCOMPARE</b>
     * 
     * Pointer to application-defined function <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nc-commctrl-pfnlvgroupcompare">LVGroupCompare</a> that is used to sort the groups.
     * @type {Pointer<PFNLVGROUPCOMPARE>}
     */
    pfnGroupCompare {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPVOID</a>*</b>
     * 
     * Data to sort; this is application-defined.
     * @type {Pointer<Void>}
     */
    pvData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvgroup">LVGROUP</a></b>
     * 
     * Group to sort; this is application-defined.
     * @type {LVGROUP}
     */
    lvGroup{
        get {
            if(!this.HasProp("__lvGroup"))
                this.__lvGroup := LVGROUP(this.ptr + 16)
            return this.__lvGroup
        }
    }
}
