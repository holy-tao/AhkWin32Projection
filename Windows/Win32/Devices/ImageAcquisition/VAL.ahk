#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCANINFO.ahk" { SCANINFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct VAL {
    #StructPack 8

    lVal : Int32

    dblVal : Float64

    pGuid : Guid.Ptr

    pScanInfo : SCANINFO.Ptr

    handle : HGLOBAL

    ppButtonNames : IntPtr

    pHandle : HANDLE.Ptr

    lReserved : Int32

    szVal : CHAR[255]

}
