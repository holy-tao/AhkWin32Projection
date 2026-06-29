#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_API_PTR.ahk" { JET_API_PTR }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_SETSYSPARAM_A {
    #StructPack 8

    paramid : UInt32

    lParam : JET_API_PTR

    sz : IntPtr

    err : Int32

}
