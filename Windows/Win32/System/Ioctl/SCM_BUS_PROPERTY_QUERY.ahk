#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_BUS_PROPERTY_ID.ahk" { SCM_BUS_PROPERTY_ID }
#Import ".\SCM_BUS_QUERY_TYPE.ahk" { SCM_BUS_QUERY_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_PROPERTY_QUERY {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    PropertyId : SCM_BUS_PROPERTY_ID

    QueryType : SCM_BUS_QUERY_TYPE

    AdditionalParameters : Int8[1]

}
