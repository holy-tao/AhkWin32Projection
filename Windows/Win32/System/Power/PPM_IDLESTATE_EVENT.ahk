#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLESTATE_EVENT {
    #StructPack 8

    NewState : UInt32

    OldState : UInt32

    Processors : Int64

}
