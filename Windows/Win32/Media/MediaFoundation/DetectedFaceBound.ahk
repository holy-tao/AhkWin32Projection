#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DetectedFaceBound {
    #StructPack 8

    sizeInBytes : UInt32

    normalizedXPosition : Float32

    normalizedYPosition : Float32

    normalizedWidth : Float32

    normalizedHeight : Float32

    confidenceValue : Int32

    flags : Int64

}
