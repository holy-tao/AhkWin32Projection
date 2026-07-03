#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEXT_DELETE_CALLBACK.ahk" { PEXT_DELETE_CALLBACK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EXT_DELETE_PARAMETERS {
    #StructPack 8

    Version : UInt32

    Reserved : UInt32

    DeleteCallback : PEXT_DELETE_CALLBACK

    DeleteContext : IntPtr

}
