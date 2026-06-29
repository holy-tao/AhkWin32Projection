#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_FRU_ID_STRING {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    IdentifierSize : UInt32

    Identifier : Int8[1]

}
