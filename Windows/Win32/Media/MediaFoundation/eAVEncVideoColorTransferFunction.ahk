#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the conversion function from R'G'B' to RGB. This enumeration is used with the AVEncVideoInputColorTransferFunction and AVEncVideoOutputColorTransferFunction properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolortransferfunction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoColorTransferFunction extends Win32Enum{

    /**
     * Use the same function as the input video. This flag applies to the <b>AVEncVideoOutputColorTransferFunction</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_SameAsSource => 0

    /**
     * Linear RGB (gamma = 1.0).
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_10 => 1

    /**
     * True 1.8 gamma. L' = L^1/1.8.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_18 => 2

    /**
     * True 2.0 gamma. L' = L^1/2.0..
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_20 => 3

    /**
     * True 2.2 gamma. L' = L^1/2.2..
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_22 => 4

    /**
     * Gamma 2.2 curve with a linear segment in the lower range. L' = 4.5L, for L &lt; 0.018; L' = 1.099L^0.45.- 0.099, for L &gt;= 0.018. This transfer function is used in BT-709, SMPTE 296M, SMPTE 170M, BT-470, and SPMTE 274M.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_22_709 => 5

    /**
     * Gamma 2.2 curve with a linear segment in the lower range. L' = 4.0L, for L &lt; 0.0228; L' = 1.1115^L0.45.- 0.01115, for L &gt;= 0.0228. This transfer function is used in SPMTE 240M.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_22_240M => 6

    /**
     * Gamma 2.4 curve with a linear segment in the lower range. L' = L/12.92, for L &lt; 0.03928; L' = ((L + 0.055) / 1.055)^2.4., for L &gt;= 0.03928.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_22_8bit_sRGB => 7

    /**
     * True 2.8 gamma. L' = L^1/2.8..
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorTransferFunction_28 => 8
}
