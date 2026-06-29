#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MQSORTKEY.ahk" { MQSORTKEY }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQSORTSET {
    #StructPack 8

    cCol : UInt32

    aCol : MQSORTKEY.Ptr

}
