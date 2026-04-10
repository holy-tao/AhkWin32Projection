#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DVDCOPY_SET_COPY_STATE extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DVDCopyState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
