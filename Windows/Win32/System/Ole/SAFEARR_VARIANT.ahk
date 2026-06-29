#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_wireVARIANT.ahk" { _wireVARIANT }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARR_VARIANT {
    #StructPack 8

    Size : UInt32

    aVariant : IntPtr

}
