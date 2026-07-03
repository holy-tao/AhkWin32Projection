#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MONITORREG.ahk" { MONITORREG }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MONITORINIT {
    #StructPack 8

    cbSize : UInt32 := this.Size

    hSpooler : HANDLE

    hckRegistryRoot : HKEY

    pMonitorReg : MONITORREG.Ptr

    bLocal : BOOL

    pszServerName : PWSTR

}
