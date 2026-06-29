#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPTRANSITIONENTRY.ahk" { SPTRANSITIONENTRY }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSTATEINFO {
    #StructPack 8

    cAllocatedEntries : UInt32

    pTransitions : SPTRANSITIONENTRY.Ptr

    cEpsilons : UInt32

    cRules : UInt32

    cWords : UInt32

    cSpecialTransitions : UInt32

}
