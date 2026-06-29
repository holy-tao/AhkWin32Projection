#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR_SCONTEXT.ahk" { NDR_SCONTEXT }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct SCONTEXT_QUEUE {
    #StructPack 8

    NumberOfObjects : UInt32

    ArrayOfObjects : IntPtr

}
