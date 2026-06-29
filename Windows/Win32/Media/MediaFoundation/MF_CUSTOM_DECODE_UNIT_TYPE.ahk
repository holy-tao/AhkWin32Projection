#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of unit contained in an IMFSample in a MFSampleExtension\_ForwardedDecodeUnits collection.
 * @remarks
 * | Member                    | Description                                                             | Value |
 * |---------------------------|-------------------------------------------------------------------------|-------|
 * | **MF\_DECODE\_UNIT\_NAL** | The unit type is network abstraction layer unit (NALU). <br/>     | 0     |
 * | **MF\_DECODE\_UNIT\_SEI** | The unit type is Supplemental Enhancement Information (SEI).<br/> | 1     |
 * @see https://learn.microsoft.com/windows/win32/medfound/mf-custom-decode-unit-type-enum
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CUSTOM_DECODE_UNIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MF_DECODE_UNIT_NAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_DECODE_UNIT_SEI => 1
}
