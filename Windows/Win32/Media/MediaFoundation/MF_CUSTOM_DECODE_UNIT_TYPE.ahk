#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
class MF_CUSTOM_DECODE_UNIT_TYPE extends Win32Enum {

    /**
     * Native name: MF_DECODE_UNIT_NAL
     * @type {Integer (Int32)}
     */
    static NAL => 0

    /**
     * Native name: MF_DECODE_UNIT_SEI
     * @type {Integer (Int32)}
     */
    static SEI => 1
}
