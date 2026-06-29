#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SILOOBJECT_BASIC_INFORMATION {
    #StructPack 4

    SiloId : UInt32

    SiloParentId : UInt32

    NumberOfProcesses : UInt32

    IsInServerSilo : BOOLEAN

    Reserved : Int8[3]

}
