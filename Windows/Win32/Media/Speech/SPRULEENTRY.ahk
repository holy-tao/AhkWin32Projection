#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRULEENTRY {
    #StructPack 8

    hRule : SPRULEHANDLE

    hInitialState : SPSTATEHANDLE

    Attributes : UInt32

    pvClientRuleContext : IntPtr

    pvClientGrammarContext : IntPtr

}
