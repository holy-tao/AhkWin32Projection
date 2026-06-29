#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSSSEED.ahk" { DSSSEED }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PRIVKEYVER3 {
    #StructPack 4

    magic : UInt32

    bitlenP : UInt32

    bitlenQ : UInt32

    bitlenJ : UInt32

    bitlenX : UInt32

    DSSSeed : DSSSEED

}
