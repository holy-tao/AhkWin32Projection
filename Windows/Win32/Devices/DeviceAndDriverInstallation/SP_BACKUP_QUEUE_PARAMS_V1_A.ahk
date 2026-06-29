#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct SP_BACKUP_QUEUE_PARAMS_V1_A {
    #StructPack 4

    cbSize : UInt32 := this.Size

    FullInfPath : CHAR[260]

    FilenameOffset : Int32

}
