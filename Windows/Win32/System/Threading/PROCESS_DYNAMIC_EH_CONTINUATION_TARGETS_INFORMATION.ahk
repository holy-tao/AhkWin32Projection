#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_DYNAMIC_EH_CONTINUATION_TARGET.ahk" { PROCESS_DYNAMIC_EH_CONTINUATION_TARGET }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION {
    #StructPack 8

    NumberOfTargets : UInt16

    Reserved : UInt16

    Reserved2 : UInt32

    Targets : PROCESS_DYNAMIC_EH_CONTINUATION_TARGET.Ptr

}
