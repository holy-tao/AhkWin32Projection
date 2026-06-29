#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDCB_STATUS_UPDATE_TYPE.ahk" { BDCB_STATUS_UPDATE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BDCB_STATUS_UPDATE_CONTEXT {
    #StructPack 4

    StatusType : BDCB_STATUS_UPDATE_TYPE

}
