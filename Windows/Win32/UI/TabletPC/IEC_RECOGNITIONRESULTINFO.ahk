#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Controls\NMHDR.ahk

/**
 * Contains information about an IInkRecognitionResult Interface object.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ns-inked-iec_recognitionresultinfo
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IEC_RECOGNITIONRESULTINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The NMHDR structure that contains standard information about the WM_NOTIFY message. The NMHDR structure contains the handle and identifier of the control that is sending the message and the notification code, which in this case is <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-messages--win32-only-">IECN_RECOGNITIONRESULT</a>. The format of the NMHDR structure is:
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
                this.__nmhdr := NMHDR(0, this)
            return this.__nmhdr
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> object that contains recognition results.
     * @type {Pointer<IInkRecognitionResult>}
     */
    RecognitionResult {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
