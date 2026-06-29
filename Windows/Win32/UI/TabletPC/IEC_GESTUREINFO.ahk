#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IInkCursor.ahk" { IInkCursor }
#Import ".\IInkStrokes.ahk" { IInkStrokes }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Controls\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }

/**
 * Contains information about a specific gesture.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ns-inked-iec_gestureinfo
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IEC_GESTUREINFO {
    #StructPack 8

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
     */
    nmhdr : NMHDR

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object that was used to create the gesture.
     */
    Cursor : IInkCursor

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection that makes up the gesture.
     */
    Strokes : IInkStrokes

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkgesture">IInkGesture</a> objects, in order of confidence. For more information about this member, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event.
     * 
     * For more information about the VARIANT structure, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     */
    Gestures : VARIANT

}
