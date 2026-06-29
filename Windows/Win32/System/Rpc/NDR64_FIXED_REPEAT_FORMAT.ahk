#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_REPEAT_FORMAT.ahk" { NDR64_REPEAT_FORMAT }
#Import ".\NDR64_POINTER_REPEAT_FLAGS.ahk" { NDR64_POINTER_REPEAT_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_FIXED_REPEAT_FORMAT {
    #StructPack 4

    RepeatFormat : NDR64_REPEAT_FORMAT

    Iterations : UInt32

    Reserved : UInt32

}
