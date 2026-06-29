#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TIMECODE structure contains basic timecode frame count information. (TIMECODE)
 * @remarks
 * Fractional frame can be used to indicate temporal offset into frame when timecode was actually read from an external device; for example, wFrameFract=0x7ff means the timecode value was read from the device at the end of the first video field.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode
 * @namespace Windows.Win32.Media
 */
export default struct TIMECODE {
    #StructPack 8

    wFrameRate : UInt16

    wFrameFract : UInt16

    dwFrames : UInt32

    static __New() {
        DefineProp(this.Prototype, 'qw', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
