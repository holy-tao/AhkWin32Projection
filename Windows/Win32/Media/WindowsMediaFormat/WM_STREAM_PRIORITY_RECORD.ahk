#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_STREAM_PRIORITY_RECORD structure contains a stream number and specifies whether delivery of that stream is mandatory.
 * @remarks
 * <b>WM_STREAM_PRIORITY_RECORD</b> is used in an array by the <b>IWMStreamPrioritization</b> interface. Each member of the array specifies a stream; the lower the element number in the array, the higher the priority of the stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_stream_priority_record
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_STREAM_PRIORITY_RECORD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>WORD</b> containing the stream number.
     * @type {Integer}
     */
    wStreamNumber {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Flag indicating whether the listed stream is mandatory. Mandatory streams will not be dropped regardless of their position in the priority list.
     * @type {BOOL}
     */
    fMandatory {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
