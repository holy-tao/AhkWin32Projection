#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PciPin2Line.ahk" { PciPin2Line }
#Import ".\PciLine2Pin.ahk" { PciLine2Pin }
#Import ".\PciReadWriteConfig.ahk" { PciReadWriteConfig }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCIBUSDATA {
    #StructPack 8

    Tag : UInt32

    Version : UInt32

    ReadConfig : PciReadWriteConfig

    WriteConfig : PciReadWriteConfig

    Pin2Line : PciPin2Line

    Line2Pin : PciLine2Pin

    ParentSlot : IntPtr

    Reserved : IntPtr[4]

}
