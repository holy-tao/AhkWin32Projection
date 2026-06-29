#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NTMS_STORAGESLOTINFORMATION.ahk" { NTMS_STORAGESLOTINFORMATION }
#Import ".\NTMS_LIBREQUESTINFORMATIONA.ahk" { NTMS_LIBREQUESTINFORMATIONA }
#Import ".\NTMS_DRIVEINFORMATIONA.ahk" { NTMS_DRIVEINFORMATIONA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FILE_DEVICE_TYPE.ahk" { FILE_DEVICE_TYPE }
#Import ".\NTMS_IEDOORINFORMATION.ahk" { NTMS_IEDOORINFORMATION }
#Import ".\NTMS_PMIDINFORMATIONA.ahk" { NTMS_PMIDINFORMATIONA }
#Import ".\NTMS_MEDIATYPEINFORMATION.ahk" { NTMS_MEDIATYPEINFORMATION }
#Import ".\NTMS_LMIDINFORMATION.ahk" { NTMS_LMIDINFORMATION }
#Import ".\NTMS_MEDIAPOOLINFORMATION.ahk" { NTMS_MEDIAPOOLINFORMATION }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\NTMS_CHANGERTYPEINFORMATIONA.ahk" { NTMS_CHANGERTYPEINFORMATIONA }
#Import ".\NTMS_COMPUTERINFORMATION.ahk" { NTMS_COMPUTERINFORMATION }
#Import ".\NTMS_DRIVETYPEINFORMATIONA.ahk" { NTMS_DRIVETYPEINFORMATIONA }
#Import ".\NTMS_LIBRARYINFORMATION.ahk" { NTMS_LIBRARYINFORMATION }
#Import ".\NTMS_PARTITIONINFORMATIONA.ahk" { NTMS_PARTITIONINFORMATIONA }
#Import ".\NTMS_CHANGERINFORMATIONA.ahk" { NTMS_CHANGERINFORMATIONA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\NTMS_IEPORTINFORMATION.ahk" { NTMS_IEPORTINFORMATION }
#Import ".\NTMS_OPREQUESTINFORMATIONA.ahk" { NTMS_OPREQUESTINFORMATIONA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The NTMS_OBJECTINFORMATION structure defines the properties that an application can get and set for RSM devices, media and system controls (such as libraries, drives, media, operator requests). This is the common structure of objects in the RSM database. (ANSI)
 * @remarks
 * All members of the 
 * <b>NTMS_OBJECTINFORMATION</b> structure are read-only at the RSM function-level unless specified as WRITABLE in the definition of the member.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_OBJECTINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_OBJECTINFORMATIONA {
    #StructPack 8


    struct _Info {
        Drive : NTMS_DRIVEINFORMATIONA

        static __New() {
            DefineProp(this.Prototype, 'DriveType', { type: NTMS_DRIVETYPEINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'Library', { type: NTMS_LIBRARYINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Changer', { type: NTMS_CHANGERINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'ChangerType', { type: NTMS_CHANGERTYPEINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'StorageSlot', { type: NTMS_STORAGESLOTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEDoor', { type: NTMS_IEDOORINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'IEPort', { type: NTMS_IEPORTINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'PhysicalMedia', { type: NTMS_PMIDINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'LogicalMedia', { type: NTMS_LMIDINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'Partition', { type: NTMS_PARTITIONINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'MediaPool', { type: NTMS_MEDIAPOOLINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'MediaType', { type: NTMS_MEDIATYPEINFORMATION, offset: 0 })
            DefineProp(this.Prototype, 'LibRequest', { type: NTMS_LIBREQUESTINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'OpRequest', { type: NTMS_OPREQUESTINFORMATIONA, offset: 0 })
            DefineProp(this.Prototype, 'Computer', { type: NTMS_COMPUTERINFORMATION, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the information structure, in bytes. This member must be set to the correct size of the structure prior to using either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-getntmsobjectinformation">GetNtmsObjectInformation</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function.
     */
    dwSize : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwType : UInt32

    /**
     * Type: <b>SYSTEMTIME</b>
     * 
     * Date/time stamp when the object was created.
     */
    Created : SYSTEMTIME

    /**
     * Type: <b>SYSTEMTIME</b>
     * 
     * Date/time stamp when the object was modified.
     */
    Modified : SYSTEMTIME

    /**
     * Type: <b>NTMS_GUID</b>
     * 
     * GUID of the object.
     */
    ObjectGuid : Guid

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the device or system control object is enabled.
     */
    Enabled : BOOL

    /**
     * Type: <b>DWORD</b>
     */
    dwOperationalState : UInt32

    /**
     * Type: <b>TCHAR[NTMS_OBJECTNAME_LENGTH]</b>
     * 
     * Name of the media, device, or system control object. Media pool and logical media names can be changed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function. All other object names are read-only.
     */
    szName : CHAR[64]

    /**
     * Type: <b>TCHAR[NTMS_DESCRIPTION_LENGTH]</b>
     * 
     * Description of the device or system control object. The description of device and system control objects can be changed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function. (Writable for all objects)
     */
    szDescription : CHAR[127]

    /**
     * Device or system control object-specific information. The format of this information depends on the <b>dwType</b> member.
     */
    Info : NTMS_OBJECTINFORMATIONA._Info

}
