#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESTRICTION.ahk" { RESTRICTION }
#Import ".\NODERESTRICTION.ahk" { NODERESTRICTION }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct VECTORRESTRICTION {
    #StructPack 8

    Node : NODERESTRICTION

    RankMethod : UInt32

}
