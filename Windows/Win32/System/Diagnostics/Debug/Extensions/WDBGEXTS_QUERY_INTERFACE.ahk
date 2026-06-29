#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WDBGEXTS_QUERY_INTERFACE {
    #StructPack 8

    Iid : Guid.Ptr

    Iface : IntPtr

}
