#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_STACK_FRAME {
    #StructPack 8

    InstructionOffset : Int64

    ReturnOffset : Int64

    FrameOffset : Int64

    StackOffset : Int64

    FuncTableEntry : Int64

    Params : Int64[4]

    Reserved : Int64[6]

    Virtual : BOOL

    FrameNumber : UInt32

}
