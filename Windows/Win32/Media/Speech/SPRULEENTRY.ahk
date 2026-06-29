#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }

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
