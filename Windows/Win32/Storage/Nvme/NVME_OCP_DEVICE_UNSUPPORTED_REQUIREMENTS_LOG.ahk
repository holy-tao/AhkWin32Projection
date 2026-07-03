#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UNSUPPORTED_REQUIREMENT.ahk" { UNSUPPORTED_REQUIREMENT }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_UNSUPPORTED_REQUIREMENTS_LOG {
    #StructPack 4

    UnsupportedCount : UInt16

    Reserved0 : Int8[14]

    UnsupportedReqList : UNSUPPORTED_REQUIREMENT[253]

    Reserved1 : Int8[14]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
