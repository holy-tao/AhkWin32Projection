#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESTRICTION.ahk" { RESTRICTION }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct NODERESTRICTION {
    #StructPack 8

    cRes : UInt32

    paRes : IntPtr

    reserved : UInt32

}
