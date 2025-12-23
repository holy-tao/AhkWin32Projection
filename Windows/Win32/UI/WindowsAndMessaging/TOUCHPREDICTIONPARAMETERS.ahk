#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains hardware input details that can be used to predict touch targets and help compensate for hardware latency when processing touch and gesture input that contains distance and velocity data.
 * @remarks
 * By default, touch prediction is activated. For information on getting pointer data without deactivating touch prediction, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getunpredictedmessagepos">GetUnpredictedMessagePos</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-touchpredictionparameters
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TOUCHPREDICTIONPARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Latency in milliseconds.
     * @type {Integer}
     */
    dwLatency {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Sample time in milliseconds (used to calculate velocity).
     * @type {Integer}
     */
    dwSampleTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Use timestamps provided by the hardware.
     * @type {Integer}
     */
    bUseHWTimeStamp {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
