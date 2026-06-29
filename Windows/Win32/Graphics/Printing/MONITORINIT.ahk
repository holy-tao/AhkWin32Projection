#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MONITORREG.ahk" { MONITORREG }

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
