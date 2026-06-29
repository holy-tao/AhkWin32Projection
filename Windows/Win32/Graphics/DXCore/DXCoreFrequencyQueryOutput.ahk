#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreFrequencyQueryOutput {
    #StructPack 8

    frequency : Int64

    maxFrequency : Int64

    maxOverclockedFrequency : Int64

}
