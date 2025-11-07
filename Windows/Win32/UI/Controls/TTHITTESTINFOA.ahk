#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include .\TTTOOLINFOA.ahk

/**
 * Contains information that a tooltip control uses to determine whether a point is in the bounding rectangle of the specified tool. If the point is in the rectangle, the structure receives information about the tool.
 * @remarks
 * 
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/ttm-hittest">TTM_HITTEST</a> message. 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines TTHITTESTINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tthittestinfoa
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class TTHITTESTINFOA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the tool or window with the specified tool.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * Client coordinates of the point to test.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(8, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tttoolinfoa">TOOLINFO</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tttoolinfoa">TOOLINFO</a> structure. If the point specified by 
     * 					<b>pt</b> is in the tool specified by 
     * 					<b>hwnd</b>, this structure receives information about the tool. The 
     * 					<b>cbSize</b> member of this structure must be filled in before sending this message.
     * @type {TTTOOLINFOA}
     */
    ti{
        get {
            if(!this.HasProp("__ti"))
                this.__ti := TTTOOLINFOA(16, this)
            return this.__ti
        }
    }
}
