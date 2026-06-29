#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ENDURANCE_INFO.ahk" { STORAGE_ENDURANCE_INFO }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_ENDURANCE_DATA_DESCRIPTOR {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    EnduranceInfo : STORAGE_ENDURANCE_INFO

}
