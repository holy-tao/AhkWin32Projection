#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WM_STREAM_PRIORITY_RECORD structure contains a stream number and specifies whether delivery of that stream is mandatory.
 * @remarks
 * <b>WM_STREAM_PRIORITY_RECORD</b> is used in an array by the <b>IWMStreamPrioritization</b> interface. Each member of the array specifies a stream; the lower the element number in the array, the higher the priority of the stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_stream_priority_record
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_STREAM_PRIORITY_RECORD {
    #StructPack 4

    /**
     * <b>WORD</b> containing the stream number.
     */
    wStreamNumber : UInt16

    /**
     * Flag indicating whether the listed stream is mandatory. Mandatory streams will not be dropped regardless of their position in the priority list.
     */
    fMandatory : BOOL

}
