#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains hardware input details that can be used to predict touch targets and help compensate for hardware latency when processing touch and gesture input that contains distance and velocity data.
 * @remarks
 * By default, touch prediction is activated. For information on getting pointer data without deactivating touch prediction, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getunpredictedmessagepos">GetUnpredictedMessagePos</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-touchpredictionparameters
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TOUCHPREDICTIONPARAMETERS {
    #StructPack 4

    /**
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Latency in milliseconds.
     */
    dwLatency : UInt32

    /**
     * Sample time in milliseconds (used to calculate velocity).
     */
    dwSampleTime : UInt32

    /**
     * Use timestamps provided by the hardware.
     */
    bUseHWTimeStamp : UInt32

}
