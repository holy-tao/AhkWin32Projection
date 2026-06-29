#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_SET_TYPE.ahk" { STORAGE_SET_TYPE }
#Import ".\STORAGE_PROPERTY_ID.ahk" { STORAGE_PROPERTY_ID }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROPERTY_SET {
    #StructPack 4

    PropertyId : STORAGE_PROPERTY_ID

    SetType : STORAGE_SET_TYPE

    AdditionalParameters : Int8[1]

}
