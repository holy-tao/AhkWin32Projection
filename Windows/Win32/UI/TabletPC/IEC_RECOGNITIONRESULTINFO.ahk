#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Controls\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IInkRecognitionResult.ahk" { IInkRecognitionResult }

/**
 * Contains information about an IInkRecognitionResult Interface object.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ns-inked-iec_recognitionresultinfo
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IEC_RECOGNITIONRESULTINFO {
    #StructPack 8

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
     */
    nmhdr : NMHDR

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognitionresult">IInkRecognitionResult</a> object that contains recognition results.
     */
    RecognitionResult : IInkRecognitionResult

}
