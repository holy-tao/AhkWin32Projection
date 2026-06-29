#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct MDAXISINFO {
    #StructPack 8

    cbSize : IntPtr := this.Size

    iAxis : IntPtr

    cDimensions : IntPtr

    cCoordinates : IntPtr

    rgcColumns : IntPtr

    rgpwszDimensionNames : PWSTR.Ptr

}
