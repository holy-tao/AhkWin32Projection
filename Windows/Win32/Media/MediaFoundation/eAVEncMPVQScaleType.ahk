#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the quantizer scale is linear or non-linear. This enumeration is used with the AVEncMPVQScaleType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvqscaletype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPVQScaleType extends Win32Enum {

    /**
     * The encoder selects the quantization scale.
     * Native name: eAVEncMPVQScaleType_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The quantization scale is linear.
     * Native name: eAVEncMPVQScaleType_Linear
     * @type {Integer (Int32)}
     */
    static Linear => 1

    /**
     * The quantization scale is non-linear.
     * Native name: eAVEncMPVQScaleType_NonLinear
     * @type {Integer (Int32)}
     */
    static NonLinear => 2
}
