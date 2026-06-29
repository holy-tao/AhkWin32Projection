#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains biometric values that the Windows Biometric Framework used to determine that an individual was present.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-presence-properties
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_PRESENCE_PROPERTIES {
    #StructPack 4


    struct _FacialFeatures {

        struct _OpaqueEngineData {
            AdapterId : Guid

            Data : UInt32[78]

        }

        BoundingBox : RECT

        Distance : Int32

        OpaqueEngineData : WINBIO_PRESENCE_PROPERTIES._FacialFeatures._OpaqueEngineData

    }

    struct _Iris {
        EyeBoundingBox_1 : RECT

        EyeBoundingBox_2 : RECT

        PupilCenter_1 : POINT

        PupilCenter_2 : POINT

        Distance : Int32

    }

    /**
     * Values for the location of facial features that the Windows Biometric Framework used to determine that an individual was present.
     */
    FacialFeatures : WINBIO_PRESENCE_PROPERTIES._FacialFeatures

    static __New() {
        DefineProp(this.Prototype, 'Iris', { type: WINBIO_PRESENCE_PROPERTIES._Iris, offset: 0 })
        this.DeleteProp("__New")
    }
}
