#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specify the types of service provider event notifications to monitor.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-event-constants
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_EVENT {
    #StructPack 4


    struct _Parameters {

        struct _Unclaimed {
            UnitId : UInt32

            RejectDetail : UInt32

        }

        struct _UnclaimedIdentify {
            UnitId : UInt32

            Identity : WINBIO_IDENTITY

            SubFactor : Int8

            RejectDetail : UInt32

        }

        struct _Error {
            ErrorCode : HRESULT

        }

        Unclaimed : WINBIO_EVENT._Parameters._Unclaimed

        static __New() {
            DefineProp(this.Prototype, 'UnclaimedIdentify', { type: WINBIO_EVENT._Parameters._UnclaimedIdentify, offset: 0 })
            DefineProp(this.Prototype, 'Error', { type: WINBIO_EVENT._Parameters._Error, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : UInt32

    Parameters : WINBIO_EVENT._Parameters

}
