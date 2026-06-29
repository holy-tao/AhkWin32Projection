#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct COINSTALLER_CONTEXT_DATA {
    #StructPack 8

    PostProcessing : BOOL

    InstallResult : UInt32

    PrivateData : IntPtr

}
