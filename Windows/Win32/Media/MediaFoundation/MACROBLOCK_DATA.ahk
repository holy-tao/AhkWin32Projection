#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MACROBLOCK_DATA {
    #StructPack 4

    flags : UInt32

    motionVectorX : Int16

    motionVectorY : Int16

    QPDelta : Int32

}
