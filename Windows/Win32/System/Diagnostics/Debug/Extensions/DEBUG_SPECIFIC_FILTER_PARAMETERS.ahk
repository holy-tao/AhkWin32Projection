#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_SPECIFIC_FILTER_PARAMETERS {
    #StructPack 4

    ExecutionOption : UInt32

    ContinueOption : UInt32

    TextSize : UInt32

    CommandSize : UInt32

    ArgumentSize : UInt32

}
