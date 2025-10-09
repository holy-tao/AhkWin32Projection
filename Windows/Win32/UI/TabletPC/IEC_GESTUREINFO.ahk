#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Controls\NMHDR.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * Contains information about a specific gesture.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ns-inked-iec_gestureinfo
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IEC_GESTUREINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The NMHDR structure that contains standard information about the WM_NOTIFY message. The NMHDR structure contains the handle and identifier of the control that is sending the message and the notification code, which in this case is <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-messages--win32-only-">IECN_GESTURE</a>. The format of the NMHDR structure is:
     * 
     * 
     * ```cpp
     * typedef struct tagNMHDR {
     *       HWND hwndFrom;
     *       UINT idFrom;
     *       UINT code;
     *   } NMHDR;
     * ```
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object that was used to create the gesture.
     * @type {Pointer<IInkCursor>}
     */
    Cursor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection that makes up the gesture.
     * @type {Pointer<IInkStrokes>}
     */
    Strokes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkgesture">IInkGesture</a> objects, in order of confidence. For more information about this member, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @type {VARIANT}
     */
    Gestures{
        get {
            if(!this.HasProp("__Gestures"))
                this.__Gestures := VARIANT(this.ptr + 40)
            return this.__Gestures
        }
    }
}
