#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_BufferfType {
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
