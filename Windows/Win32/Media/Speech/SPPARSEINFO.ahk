#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPPATHENTRY.ahk" { SPPATHENTRY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPRULEHANDLE.ahk" { SPRULEHANDLE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPARSEINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    hRule : SPRULEHANDLE

    ullAudioStreamPosition : Int64

    ulAudioSize : UInt32

    cTransitions : UInt32

    pPath : SPPATHENTRY.Ptr

    SREngineID : Guid

    ulSREnginePrivateDataSize : UInt32

    pSREnginePrivateData : IntPtr

    fHypothesis : BOOL

}
