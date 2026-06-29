#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\eAVEncVideoQPMapElementDataType.ahk" { eAVEncVideoQPMapElementDataType }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct InputQPSettings {
    #StructPack 4

    minBlockSize : UInt32

    maxBlockSize : UInt32

    stepsBlockSize : UInt32

    dataType : eAVEncVideoQPMapElementDataType

    minValue : Int16

    maxValue : Int16

    step : UInt16

}
