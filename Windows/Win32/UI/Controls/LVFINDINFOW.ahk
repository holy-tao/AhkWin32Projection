#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information used when searching for a list-view item. This structure is identical to LV_FINDINFO but has been renamed to fit standard naming conventions.
 * @remarks
 * 
 * > [!NOTE]
 * > The commctrl.h header defines LVFINDINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvfindinfow
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class LVFINDINFOW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * Address of a null-terminated string to compare with the item text. It is valid only if LVFI_STRING or LVFI_PARTIAL is set in the <b>flags</b> member.
     * @type {PWSTR}
     */
    psz {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Value to compare with the <b>lParam</b> member of a list-view item's <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure. It is valid only if LVFI_PARAM is set in the <b>flags</b> member.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure with the initial search position. It is valid only if LVFI_NEARESTXY is set in the <b>flags</b> member.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(24, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Virtual key code that specifies the direction to search. The following codes are supported: 
     * 			
     *             		
     * 
     * <ul>
     * <li>VK_LEFT </li>
     * <li>VK_RIGHT </li>
     * <li>VK_UP </li>
     * <li>VK_DOWN </li>
     * <li>VK_HOME </li>
     * <li>VK_END </li>
     * <li>VK_PRIOR </li>
     * <li>VK_NEXT </li>
     * </ul>
     * This member is valid only if LVFI_NEARESTXY is set in the <b>flags</b> member.
     * @type {Integer}
     */
    vkDirection {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
