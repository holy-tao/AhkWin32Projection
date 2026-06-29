#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_BACKUP_QUEUE_PARAMS_V2_W {
    #StructPack 4

    cbSize : UInt32 := this.Size

    FullInfPath : WCHAR[260]

    FilenameOffset : Int32

    ReinstallInstance : WCHAR[260]

}
