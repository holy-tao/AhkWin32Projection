#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_THROTTLING_PROCESS_STATE {
    #StructPack 4

    Version : UInt32

    ControlMask : UInt32

    StateMask : UInt32

}
