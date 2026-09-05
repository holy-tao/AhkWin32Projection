#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_BufferfType extends Win32Enum {

    /**
     * Native name: DXVA2_PictureParametersBufferType
     * @type {Integer (Int32)}
     */
    static PictureParametersBufferType => 0

    /**
     * Native name: DXVA2_MacroBlockControlBufferType
     * @type {Integer (Int32)}
     */
    static MacroBlockControlBufferType => 1

    /**
     * Native name: DXVA2_ResidualDifferenceBufferType
     * @type {Integer (Int32)}
     */
    static ResidualDifferenceBufferType => 2

    /**
     * Native name: DXVA2_DeblockingControlBufferType
     * @type {Integer (Int32)}
     */
    static DeblockingControlBufferType => 3

    /**
     * Native name: DXVA2_InverseQuantizationMatrixBufferType
     * @type {Integer (Int32)}
     */
    static InverseQuantizationMatrixBufferType => 4

    /**
     * Native name: DXVA2_SliceControlBufferType
     * @type {Integer (Int32)}
     */
    static SliceControlBufferType => 5

    /**
     * Native name: DXVA2_BitStreamDateBufferType
     * @type {Integer (Int32)}
     */
    static BitStreamDateBufferType => 6

    /**
     * Native name: DXVA2_MotionVectorBuffer
     * @type {Integer (Int32)}
     */
    static MotionVectorBuffer => 7

    /**
     * Native name: DXVA2_FilmGrainBuffer
     * @type {Integer (Int32)}
     */
    static FilmGrainBuffer => 8
}
