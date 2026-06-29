#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARR_DISPATCH {
    #StructPack 8

    Size : UInt32

    apDispatch : IDispatch.Ptr

}
