#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPPHRASEPROPERTY.ahk" { SPPHRASEPROPERTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPPHRASEELEMENT.ahk" { SPPHRASEELEMENT }
#Import ".\SPPHRASEREPLACEMENT.ahk" { SPPHRASEREPLACEMENT }
#Import ".\SPPHRASERULE.ahk" { SPPHRASERULE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASE_50 {
    #StructPack 8

    cbSize : UInt32 := this.Size

    LangID : UInt16

    wHomophoneGroupId : UInt16

    ullGrammarID : Int64

    ftStartTime : Int64

    ullAudioStreamPosition : Int64

    ulAudioSizeBytes : UInt32

    ulRetainedSizeBytes : UInt32

    ulAudioSizeTime : UInt32

    Rule : SPPHRASERULE

    pProperties : SPPHRASEPROPERTY.Ptr

    pElements : SPPHRASEELEMENT.Ptr

    cReplacements : UInt32

    pReplacements : SPPHRASEREPLACEMENT.Ptr

    SREngineID : Guid

    ulSREnginePrivateDataSize : UInt32

    pSREnginePrivateData : IntPtr

}
