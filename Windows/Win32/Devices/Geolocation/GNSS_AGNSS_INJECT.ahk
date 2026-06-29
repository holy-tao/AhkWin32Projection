#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_AGNSS_INJECTBLOB.ahk" { GNSS_AGNSS_INJECTBLOB }
#Import ".\GNSS_AGNSS_INJECTPOSITION.ahk" { GNSS_AGNSS_INJECTPOSITION }
#Import ".\GNSS_AGNSS_INJECTTIME.ahk" { GNSS_AGNSS_INJECTTIME }
#Import ".\GNSS_FIXDATA_BASIC.ahk" { GNSS_FIXDATA_BASIC }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\GNSS_FIXDATA_ACCURACY.ahk" { GNSS_FIXDATA_ACCURACY }
#Import ".\GNSS_AGNSS_REQUEST_TYPE.ahk" { GNSS_AGNSS_REQUEST_TYPE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_AGNSS_INJECT {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    InjectionType : GNSS_AGNSS_REQUEST_TYPE

    InjectionStatus : NTSTATUS

    InjectionDataSize : UInt32

    Unused : Int8[512]

    Time : GNSS_AGNSS_INJECTTIME

    static __New() {
        DefineProp(this.Prototype, 'Position', { type: GNSS_AGNSS_INJECTPOSITION, offset: 536 })
        DefineProp(this.Prototype, 'BlobData', { type: GNSS_AGNSS_INJECTBLOB, offset: 536 })
        this.DeleteProp("__New")
    }
}
