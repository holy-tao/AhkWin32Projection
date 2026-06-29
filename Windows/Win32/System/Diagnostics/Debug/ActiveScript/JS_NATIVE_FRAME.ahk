#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct JS_NATIVE_FRAME {
    #StructPack 8

    InstructionOffset : Int64

    ReturnOffset : Int64

    FrameOffset : Int64

    StackOffset : Int64

}
