#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_BUS_SET_TYPE.ahk" { SCM_BUS_SET_TYPE }
#Import ".\SCM_BUS_PROPERTY_ID.ahk" { SCM_BUS_PROPERTY_ID }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_PROPERTY_SET {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    PropertyId : SCM_BUS_PROPERTY_ID

    SetType : SCM_BUS_SET_TYPE

    AdditionalParameters : Int8[1]

}
