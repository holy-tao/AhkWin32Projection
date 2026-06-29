#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NTMS_IEPORTINFORMATION.ahk" { NTMS_IEPORTINFORMATION }
#Import ".\NTMS_I1_PMIDINFORMATIONW.ahk" { NTMS_I1_PMIDINFORMATIONW }
#Import ".\NTMS_CHANGERTYPEINFORMATIONW.ahk" { NTMS_CHANGERTYPEINFORMATIONW }
#Import ".\FILE_DEVICE_TYPE.ahk" { FILE_DEVICE_TYPE }
#Import ".\NTMS_I1_LIBREQUESTINFORMATIONW.ahk" { NTMS_I1_LIBREQUESTINFORMATIONW }
#Import ".\NTMS_I1_LIBRARYINFORMATION.ahk" { NTMS_I1_LIBRARYINFORMATION }
#Import ".\NTMS_STORAGESLOTINFORMATION.ahk" { NTMS_STORAGESLOTINFORMATION }
#Import ".\NTMS_DRIVETYPEINFORMATIONW.ahk" { NTMS_DRIVETYPEINFORMATIONW }
#Import ".\NTMS_MEDIATYPEINFORMATION.ahk" { NTMS_MEDIATYPEINFORMATION }
#Import ".\NTMS_IEDOORINFORMATION.ahk" { NTMS_IEDOORINFORMATION }
#Import ".\NTMS_CHANGERINFORMATIONW.ahk" { NTMS_CHANGERINFORMATIONW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\NTMS_DRIVEINFORMATIONW.ahk" { NTMS_DRIVEINFORMATIONW }
#Import ".\NTMS_I1_PARTITIONINFORMATIONW.ahk" { NTMS_I1_PARTITIONINFORMATIONW }
#Import ".\NTMS_I1_OPREQUESTINFORMATIONW.ahk" { NTMS_I1_OPREQUESTINFORMATIONW }
#Import ".\NTMS_MEDIAPOOLINFORMATION.ahk" { NTMS_MEDIAPOOLINFORMATION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NTMS_LMIDINFORMATION.ahk" { NTMS_LMIDINFORMATION }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_I1_OBJECTINFORMATIONW {
    #StructPack 4


    struct _Info {
        Drive : NTMS_DRIVEINFORMATIONW

        static __New() {
            DefineProp(this.Prototype, 'DriveType', { type: NTMS_DRIVETYPEINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'Library', { type: NTMS_I1_LIBRARYINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Changer', { type: NTMS_CHANGERINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'ChangerType', { type: NTMS_CHANGERTYPEINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'StorageSlot', { type: NTMS_STORAGESLOTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEDoor', { type: NTMS_IEDOORINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEPort', { type: NTMS_IEPORTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'PhysicalMedia', { type: NTMS_I1_PMIDINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'LogicalMedia', { type: NTMS_LMIDINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Partition', { type: NTMS_I1_PARTITIONINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'MediaPool', { type: NTMS_MEDIAPOOLINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'MediaType', { type: NTMS_MEDIATYPEINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'LibRequest', { type: NTMS_I1_LIBREQUESTINFORMATIONW, offset: 0 })
            DefineProp(this.Prototype, 'OpRequest', { type: NTMS_I1_OPREQUESTINFORMATIONW, offset: 0 })
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

    szName : WCHAR[64]

    szDescription : WCHAR[127]

    Info : NTMS_I1_OBJECTINFORMATIONW._Info

}
