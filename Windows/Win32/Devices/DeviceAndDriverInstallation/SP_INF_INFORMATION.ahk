#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INF_STYLE.ahk" { INF_STYLE }

/**
 * The SP_INF_INFORMATION structure stores information about an INF file, including the style, number of constituent INF files, and version data.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_information
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_INF_INFORMATION {
    #StructPack 4

    InfStyle : INF_STYLE

    /**
     * Number of constituent INF files.
     */
    InfCount : UInt32

    /**
     * Stores information from the <b>Version</b> section of an INF file in an array of <b>ANYSIZE_ARRAY</b> bytes.
     */
    VersionData : Int8[1]

}
