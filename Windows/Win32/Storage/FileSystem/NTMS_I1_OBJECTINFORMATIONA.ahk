#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NTMS_STORAGESLOTINFORMATION.ahk" { NTMS_STORAGESLOTINFORMATION }
#Import ".\NTMS_DRIVEINFORMATIONA.ahk" { NTMS_DRIVEINFORMATIONA }
#Import ".\NTMS_I1_PARTITIONINFORMATIONA.ahk" { NTMS_I1_PARTITIONINFORMATIONA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NTMS_I1_OPREQUESTINFORMATIONA.ahk" { NTMS_I1_OPREQUESTINFORMATIONA }
#Import ".\FILE_DEVICE_TYPE.ahk" { FILE_DEVICE_TYPE }
#Import ".\NTMS_IEDOORINFORMATION.ahk" { NTMS_IEDOORINFORMATION }
#Import ".\NTMS_I1_LIBRARYINFORMATION.ahk" { NTMS_I1_LIBRARYINFORMATION }
#Import ".\NTMS_MEDIATYPEINFORMATION.ahk" { NTMS_MEDIATYPEINFORMATION }
#Import ".\NTMS_LMIDINFORMATION.ahk" { NTMS_LMIDINFORMATION }
#Import ".\NTMS_MEDIAPOOLINFORMATION.ahk" { NTMS_MEDIAPOOLINFORMATION }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\NTMS_CHANGERTYPEINFORMATIONA.ahk" { NTMS_CHANGERTYPEINFORMATIONA }
#Import ".\NTMS_DRIVETYPEINFORMATIONA.ahk" { NTMS_DRIVETYPEINFORMATIONA }
#Import ".\NTMS_CHANGERINFORMATIONA.ahk" { NTMS_CHANGERINFORMATIONA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\NTMS_IEPORTINFORMATION.ahk" { NTMS_IEPORTINFORMATION }
#Import ".\NTMS_I1_LIBREQUESTINFORMATIONA.ahk" { NTMS_I1_LIBREQUESTINFORMATIONA }
#Import ".\NTMS_I1_PMIDINFORMATIONA.ahk" { NTMS_I1_PMIDINFORMATIONA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_I1_OBJECTINFORMATIONA {
    #StructPack 4


    struct _Info {
        Drive : NTMS_DRIVEINFORMATIONA

        static __New() {
            DefineProp(this.Prototype, 'DriveType', { type: NTMS_DRIVETYPEINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'Library', { type: NTMS_I1_LIBRARYINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Changer', { type: NTMS_CHANGERINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'ChangerType', { type: NTMS_CHANGERTYPEINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'StorageSlot', { type: NTMS_STORAGESLOTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEDoor', { type: NTMS_IEDOORINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEPort', { type: NTMS_IEPORTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'PhysicalMedia', { type: NTMS_I1_PMIDINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'LogicalMedia', { type: NTMS_LMIDINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Partition', { type: NTMS_I1_PARTITIONINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'MediaPool', { type: NTMS_MEDIAPOOLINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'MediaType', { type: NTMS_MEDIATYPEINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'LibRequest', { type: NTMS_I1_LIBREQUESTINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'OpRequest', { type: NTMS_I1_OPREQUESTINFORMATIONA, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    dwSize : UInt32

    dwType : UInt32

    Created : SYSTEMTIME

    Modified : SYSTEMTIME

    ObjectGuid : Guid

    Enabled : BOOL

    dwOperationalState : UInt32

    szName : CHAR[64]

    szDescription : CHAR[127]

    Info : NTMS_I1_OBJECTINFORMATIONA._Info

}
