#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_wireBRECORD.ahk" { _wireBRECORD }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARR_BRECORD {
    #StructPack 8

    Size : UInt32

    aRecord : IntPtr

}
