#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the quantizer scale is linear or non-linear. This enumeration is used with the AVEncMPVQScaleType property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpvqscaletype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVQScaleType extends Win32Enum{

    /**
     * The encoder selects the quantization scale.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_Auto => 0

    /**
     * The quantization scale is linear.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_Linear => 1

    /**
     * The quantization scale is non-linear.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVQScaleType_NonLinear => 2
}
