#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MP_STORAGE_DIAGNOSTIC_LEVEL.ahk" { MP_STORAGE_DIAGNOSTIC_LEVEL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MP_STORAGE_DIAGNOSTIC_TARGET_TYPE.ahk" { MP_STORAGE_DIAGNOSTIC_TARGET_TYPE }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_DIAGNOSTIC_MP_REQUEST {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    TargetType : MP_STORAGE_DIAGNOSTIC_TARGET_TYPE

    Level : MP_STORAGE_DIAGNOSTIC_LEVEL

    ProviderId : Guid

    BufferSize : UInt32

    Reserved : UInt32

    DataBuffer : Int8[1]

}
