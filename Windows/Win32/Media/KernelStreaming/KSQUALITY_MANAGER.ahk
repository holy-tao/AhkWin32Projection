#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSQUALITY_MANAGER {
    #StructPack 8

    QualityManager : HANDLE

    Context : IntPtr

}
