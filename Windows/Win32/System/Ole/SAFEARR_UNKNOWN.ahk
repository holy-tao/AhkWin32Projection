#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARR_UNKNOWN {
    #StructPack 8

    Size : UInt32

    apUnknown : IUnknown.Ptr

}
