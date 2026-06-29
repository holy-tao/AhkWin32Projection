#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_PROFILE_MEDIAINFO.ahk" { KSCAMERA_PROFILE_MEDIAINFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PROFILE_PININFO {
    #StructPack 8

    PinCategory : Guid

    PinIndex : UInt16

    ProfileSensorType : UInt16

    MediaInfoCount : UInt32

    MediaInfos : KSCAMERA_PROFILE_MEDIAINFO.Ptr

    static __New() {
        DefineProp(this.Prototype, 'Reserved', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
