#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPTRANSITIONID.ahk" { SPTRANSITIONID }
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }
#Import ".\SPWORDHANDLE.ahk" { SPWORDHANDLE }
#Import ".\SPSTATEHANDLE.ahk" { SPSTATEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPTRANSITIONENTRY {
    #StructPack 8

    ID : SPTRANSITIONID

    hNextState : SPSTATEHANDLE

    Type : Int8

    RequiredConfidence : Int8

    fHasProperty : UInt32

    Weight : Float32

    hRuleInitialState : SPSTATEHANDLE

    hRule : SPRULEHANDLE

    pvClientRuleContext : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'hWord', { type: SPWORDHANDLE, offset: 32 })
        DefineProp(this.Prototype, 'pvClientWordContext', { type: IntPtr, offset: 40 })
        DefineProp(this.Prototype, 'pvGrammarCookie', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
