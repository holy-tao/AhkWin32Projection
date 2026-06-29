#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_VALUE_CAPS {
    #StructPack 4


    struct _Range {
        UsageMin : UInt16

        UsageMax : UInt16

        StringMin : UInt16

        StringMax : UInt16

        DesignatorMin : UInt16

        DesignatorMax : UInt16

        DataIndexMin : UInt16

        DataIndexMax : UInt16

    }

    struct _NotRange {
        Usage : UInt16

        Reserved1 : UInt16

        StringIndex : UInt16

        Reserved2 : UInt16

        DesignatorIndex : UInt16

        Reserved3 : UInt16

        DataIndex : UInt16

        Reserved4 : UInt16

    }

    UsagePage : UInt16

    ReportID : Int8

    IsAlias : BOOLEAN

    BitField : UInt16

    LinkCollection : UInt16

    LinkUsage : UInt16

    LinkUsagePage : UInt16

    IsRange : BOOLEAN

    IsStringRange : BOOLEAN

    IsDesignatorRange : BOOLEAN

    IsAbsolute : BOOLEAN

    HasNull : BOOLEAN

    Reserved : Int8

    BitSize : UInt16

    ReportCount : UInt16

    Reserved2 : UInt16[5]

    UnitsExp : UInt32

    Units : UInt32

    LogicalMin : Int32

    LogicalMax : Int32

    PhysicalMin : Int32

    PhysicalMax : Int32

    Range : HIDP_VALUE_CAPS._Range

    static __New() {
        DefineProp(this.Prototype, 'NotRange', { type: HIDP_VALUE_CAPS._NotRange, offset: 56 })
        this.DeleteProp("__New")
    }
}
