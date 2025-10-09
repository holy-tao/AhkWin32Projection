#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\NTMS_DRIVEINFORMATIONW.ahk
#Include .\NTMS_DRIVETYPEINFORMATIONW.ahk
#Include .\NTMS_LIBRARYINFORMATION.ahk
#Include .\NTMS_CHANGERINFORMATIONW.ahk
#Include .\NTMS_CHANGERTYPEINFORMATIONW.ahk
#Include .\NTMS_STORAGESLOTINFORMATION.ahk
#Include .\NTMS_IEDOORINFORMATION.ahk
#Include .\NTMS_IEPORTINFORMATION.ahk
#Include .\NTMS_PMIDINFORMATIONW.ahk
#Include .\NTMS_LMIDINFORMATION.ahk
#Include .\NTMS_PARTITIONINFORMATIONW.ahk
#Include .\NTMS_MEDIAPOOLINFORMATION.ahk
#Include .\NTMS_MEDIATYPEINFORMATION.ahk
#Include .\NTMS_LIBREQUESTINFORMATIONW.ahk
#Include .\NTMS_OPREQUESTINFORMATIONW.ahk
#Include .\NTMS_COMPUTERINFORMATION.ahk

/**
 * The NTMS_OBJECTINFORMATION structure defines the properties that an application can get and set for RSM devices, media and system controls (such as libraries, drives, media, operator requests). This is the common structure of objects in the RSM database. (Unicode)
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
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_objectinformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_OBJECTINFORMATIONW extends Win32Struct
{
    static sizeof => 1400

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Size of the information structure, in bytes. This member must be set to the correct size of the structure prior to using either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-getntmsobjectinformation">GetNtmsObjectInformation</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>SYSTEMTIME</b>
     * 
     * Date/time stamp when the object was created.
     * @type {SYSTEMTIME}
     */
    Created{
        get {
            if(!this.HasProp("__Created"))
                this.__Created := SYSTEMTIME(this.ptr + 8)
            return this.__Created
        }
    }

    /**
     * Type: <b>SYSTEMTIME</b>
     * 
     * Date/time stamp when the object was modified.
     * @type {SYSTEMTIME}
     */
    Modified{
        get {
            if(!this.HasProp("__Modified"))
                this.__Modified := SYSTEMTIME(this.ptr + 24)
            return this.__Modified
        }
    }

    /**
     * Type: <b>NTMS_GUID</b>
     * 
     * GUID of the object.
     * @type {Pointer<Guid>}
     */
    ObjectGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the device or system control object is enabled.
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwOperationalState {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>TCHAR[NTMS_OBJECTNAME_LENGTH]</b>
     * 
     * Name of the media, device, or system control object. Media pool and logical media names can be changed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function. All other object names are read-only.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 56, 63, "UTF-16")
        set => StrPut(value, this.ptr + 56, 63, "UTF-16")
    }

    /**
     * Type: <b>TCHAR[NTMS_DESCRIPTION_LENGTH]</b>
     * 
     * Description of the device or system control object. The description of device and system control objects can be changed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/nf-ntmsapi-setntmsobjectinformation">SetNtmsObjectInformation</a> function. (Writable for all objects)
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 184, 126, "UTF-16")
        set => StrPut(value, this.ptr + 184, 126, "UTF-16")
    }

    /**
     * @type {NTMS_DRIVEINFORMATIONW}
     */
    Drive{
        get {
            if(!this.HasProp("__Drive"))
                this.__Drive := NTMS_DRIVEINFORMATIONW(this.ptr + 440)
            return this.__Drive
        }
    }

    /**
     * @type {NTMS_DRIVETYPEINFORMATIONW}
     */
    DriveType{
        get {
            if(!this.HasProp("__DriveType"))
                this.__DriveType := NTMS_DRIVETYPEINFORMATIONW(this.ptr + 440)
            return this.__DriveType
        }
    }

    /**
     * @type {NTMS_LIBRARYINFORMATION}
     */
    Library{
        get {
            if(!this.HasProp("__Library"))
                this.__Library := NTMS_LIBRARYINFORMATION(this.ptr + 440)
            return this.__Library
        }
    }

    /**
     * @type {NTMS_CHANGERINFORMATIONW}
     */
    Changer{
        get {
            if(!this.HasProp("__Changer"))
                this.__Changer := NTMS_CHANGERINFORMATIONW(this.ptr + 440)
            return this.__Changer
        }
    }

    /**
     * @type {NTMS_CHANGERTYPEINFORMATIONW}
     */
    ChangerType{
        get {
            if(!this.HasProp("__ChangerType"))
                this.__ChangerType := NTMS_CHANGERTYPEINFORMATIONW(this.ptr + 440)
            return this.__ChangerType
        }
    }

    /**
     * @type {NTMS_STORAGESLOTINFORMATION}
     */
    StorageSlot{
        get {
            if(!this.HasProp("__StorageSlot"))
                this.__StorageSlot := NTMS_STORAGESLOTINFORMATION(this.ptr + 440)
            return this.__StorageSlot
        }
    }

    /**
     * @type {NTMS_IEDOORINFORMATION}
     */
    IEDoor{
        get {
            if(!this.HasProp("__IEDoor"))
                this.__IEDoor := NTMS_IEDOORINFORMATION(this.ptr + 440)
            return this.__IEDoor
        }
    }

    /**
     * @type {NTMS_IEPORTINFORMATION}
     */
    IEPort{
        get {
            if(!this.HasProp("__IEPort"))
                this.__IEPort := NTMS_IEPORTINFORMATION(this.ptr + 440)
            return this.__IEPort
        }
    }

    /**
     * @type {NTMS_PMIDINFORMATIONW}
     */
    PhysicalMedia{
        get {
            if(!this.HasProp("__PhysicalMedia"))
                this.__PhysicalMedia := NTMS_PMIDINFORMATIONW(this.ptr + 440)
            return this.__PhysicalMedia
        }
    }

    /**
     * @type {NTMS_LMIDINFORMATION}
     */
    LogicalMedia{
        get {
            if(!this.HasProp("__LogicalMedia"))
                this.__LogicalMedia := NTMS_LMIDINFORMATION(this.ptr + 440)
            return this.__LogicalMedia
        }
    }

    /**
     * @type {NTMS_PARTITIONINFORMATIONW}
     */
    Partition{
        get {
            if(!this.HasProp("__Partition"))
                this.__Partition := NTMS_PARTITIONINFORMATIONW(this.ptr + 440)
            return this.__Partition
        }
    }

    /**
     * @type {NTMS_MEDIAPOOLINFORMATION}
     */
    MediaPool{
        get {
            if(!this.HasProp("__MediaPool"))
                this.__MediaPool := NTMS_MEDIAPOOLINFORMATION(this.ptr + 440)
            return this.__MediaPool
        }
    }

    /**
     * @type {NTMS_MEDIATYPEINFORMATION}
     */
    MediaType{
        get {
            if(!this.HasProp("__MediaType"))
                this.__MediaType := NTMS_MEDIATYPEINFORMATION(this.ptr + 440)
            return this.__MediaType
        }
    }

    /**
     * @type {NTMS_LIBREQUESTINFORMATIONW}
     */
    LibRequest{
        get {
            if(!this.HasProp("__LibRequest"))
                this.__LibRequest := NTMS_LIBREQUESTINFORMATIONW(this.ptr + 440)
            return this.__LibRequest
        }
    }

    /**
     * @type {NTMS_OPREQUESTINFORMATIONW}
     */
    OpRequest{
        get {
            if(!this.HasProp("__OpRequest"))
                this.__OpRequest := NTMS_OPREQUESTINFORMATIONW(this.ptr + 440)
            return this.__OpRequest
        }
    }

    /**
     * @type {NTMS_COMPUTERINFORMATION}
     */
    Computer{
        get {
            if(!this.HasProp("__Computer"))
                this.__Computer := NTMS_COMPUTERINFORMATION(this.ptr + 440)
            return this.__Computer
        }
    }
}
