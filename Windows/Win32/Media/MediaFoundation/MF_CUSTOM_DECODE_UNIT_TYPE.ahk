#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/mf-custom-decode-unit-type-enum
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CUSTOM_DECODE_UNIT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_DECODE_UNIT_NAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_DECODE_UNIT_SEI => 1
}
