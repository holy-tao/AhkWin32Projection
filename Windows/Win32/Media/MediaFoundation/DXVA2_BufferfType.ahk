#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_BufferfType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_PictureParametersBufferType => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_MacroBlockControlBufferType => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_ResidualDifferenceBufferType => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DeblockingControlBufferType => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_InverseQuantizationMatrixBufferType => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SliceControlBufferType => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_BitStreamDateBufferType => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_MotionVectorBuffer => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_FilmGrainBuffer => 8
}
