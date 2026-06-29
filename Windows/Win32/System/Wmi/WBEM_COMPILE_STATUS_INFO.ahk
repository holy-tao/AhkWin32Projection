#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_COMPILE_STATUS_INFO {
    #StructPack 4

    lPhaseError : Int32

    hRes : HRESULT

    ObjectNum : Int32

    FirstLine : Int32

    LastLine : Int32

    dwOutFlags : UInt32

}
