#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USN_RECORD_V2.ahk" { USN_RECORD_V2 }
#Import ".\USN_RECORD_V4.ahk" { USN_RECORD_V4 }
#Import "..\..\Storage\FileSystem\FILE_ID_128.ahk" { FILE_ID_128 }
#Import ".\USN_RECORD_EXTENT.ahk" { USN_RECORD_EXTENT }
#Import ".\USN_RECORD_COMMON_HEADER.ahk" { USN_RECORD_COMMON_HEADER }
#Import ".\USN_SOURCE_INFO_ID.ahk" { USN_SOURCE_INFO_ID }
#Import ".\USN_RECORD_V3.ahk" { USN_RECORD_V3 }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_RECORD_UNION {
    #StructPack 8

    Header : USN_RECORD_COMMON_HEADER

    static __New() {
        DefineProp(this.Prototype, 'V2', { type: USN_RECORD_V2, offset: 0 })
        DefineProp(this.Prototype, 'V3', { type: USN_RECORD_V3, offset: 0 })
        DefineProp(this.Prototype, 'V4', { type: USN_RECORD_V4, offset: 0 })
        this.DeleteProp("__New")
    }
}
