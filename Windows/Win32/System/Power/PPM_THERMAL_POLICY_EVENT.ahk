#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_THERMAL_POLICY_EVENT {
    #StructPack 8

    Mode : Int8

    Processors : Int64

}
