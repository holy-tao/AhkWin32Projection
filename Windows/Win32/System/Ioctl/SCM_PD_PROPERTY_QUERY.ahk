#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_QUERY_TYPE.ahk" { SCM_PD_QUERY_TYPE }
#Import ".\SCM_PD_PROPERTY_ID.ahk" { SCM_PD_PROPERTY_ID }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_PROPERTY_QUERY {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    PropertyId : SCM_PD_PROPERTY_ID

    QueryType : SCM_PD_QUERY_TYPE

    AdditionalParameters : Int8[1]

}
