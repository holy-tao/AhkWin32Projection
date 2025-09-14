#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\NTMS_DRIVEINFORMATIONA.ahk
#Include .\NTMS_DRIVETYPEINFORMATIONA.ahk
#Include .\NTMS_I1_LIBRARYINFORMATION.ahk
#Include .\NTMS_CHANGERINFORMATIONA.ahk
#Include .\NTMS_CHANGERTYPEINFORMATIONA.ahk
#Include .\NTMS_STORAGESLOTINFORMATION.ahk
#Include .\NTMS_IEDOORINFORMATION.ahk
#Include .\NTMS_IEPORTINFORMATION.ahk
#Include .\NTMS_I1_PMIDINFORMATIONA.ahk
#Include .\NTMS_LMIDINFORMATION.ahk
#Include .\NTMS_I1_PARTITIONINFORMATIONA.ahk
#Include .\NTMS_MEDIAPOOLINFORMATION.ahk
#Include .\NTMS_MEDIATYPEINFORMATION.ahk
#Include .\NTMS_I1_LIBREQUESTINFORMATIONA.ahk
#Include .\NTMS_I1_OPREQUESTINFORMATIONA.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_OBJECTINFORMATIONA extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
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
     * @type {Pointer<Guid>}
     */
    ObjectGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwOperationalState {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Array<SByte>}
     */
    szName{
        get {
            if(!this.HasProp("__szNameProxyArray"))
                this.__szNameProxyArray := Win32FixedArray(this.ptr + 56, 64, Primitive, "char")
            return this.__szNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 120, 127, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
    }

    /**
     * @type {NTMS_DRIVEINFORMATIONA}
     */
    Drive{
        get {
            if(!this.HasProp("__Drive"))
                this.__Drive := NTMS_DRIVEINFORMATIONA(this.ptr + 248)
            return this.__Drive
        }
    }

    /**
     * @type {NTMS_DRIVETYPEINFORMATIONA}
     */
    DriveType{
        get {
            if(!this.HasProp("__DriveType"))
                this.__DriveType := NTMS_DRIVETYPEINFORMATIONA(this.ptr + 248)
            return this.__DriveType
        }
    }

    /**
     * @type {NTMS_I1_LIBRARYINFORMATION}
     */
    Library{
        get {
            if(!this.HasProp("__Library"))
                this.__Library := NTMS_I1_LIBRARYINFORMATION(this.ptr + 248)
            return this.__Library
        }
    }

    /**
     * @type {NTMS_CHANGERINFORMATIONA}
     */
    Changer{
        get {
            if(!this.HasProp("__Changer"))
                this.__Changer := NTMS_CHANGERINFORMATIONA(this.ptr + 248)
            return this.__Changer
        }
    }

    /**
     * @type {NTMS_CHANGERTYPEINFORMATIONA}
     */
    ChangerType{
        get {
            if(!this.HasProp("__ChangerType"))
                this.__ChangerType := NTMS_CHANGERTYPEINFORMATIONA(this.ptr + 248)
            return this.__ChangerType
        }
    }

    /**
     * @type {NTMS_STORAGESLOTINFORMATION}
     */
    StorageSlot{
        get {
            if(!this.HasProp("__StorageSlot"))
                this.__StorageSlot := NTMS_STORAGESLOTINFORMATION(this.ptr + 248)
            return this.__StorageSlot
        }
    }

    /**
     * @type {NTMS_IEDOORINFORMATION}
     */
    IEDoor{
        get {
            if(!this.HasProp("__IEDoor"))
                this.__IEDoor := NTMS_IEDOORINFORMATION(this.ptr + 248)
            return this.__IEDoor
        }
    }

    /**
     * @type {NTMS_IEPORTINFORMATION}
     */
    IEPort{
        get {
            if(!this.HasProp("__IEPort"))
                this.__IEPort := NTMS_IEPORTINFORMATION(this.ptr + 248)
            return this.__IEPort
        }
    }

    /**
     * @type {NTMS_I1_PMIDINFORMATIONA}
     */
    PhysicalMedia{
        get {
            if(!this.HasProp("__PhysicalMedia"))
                this.__PhysicalMedia := NTMS_I1_PMIDINFORMATIONA(this.ptr + 248)
            return this.__PhysicalMedia
        }
    }

    /**
     * @type {NTMS_LMIDINFORMATION}
     */
    LogicalMedia{
        get {
            if(!this.HasProp("__LogicalMedia"))
                this.__LogicalMedia := NTMS_LMIDINFORMATION(this.ptr + 248)
            return this.__LogicalMedia
        }
    }

    /**
     * @type {NTMS_I1_PARTITIONINFORMATIONA}
     */
    Partition{
        get {
            if(!this.HasProp("__Partition"))
                this.__Partition := NTMS_I1_PARTITIONINFORMATIONA(this.ptr + 248)
            return this.__Partition
        }
    }

    /**
     * @type {NTMS_MEDIAPOOLINFORMATION}
     */
    MediaPool{
        get {
            if(!this.HasProp("__MediaPool"))
                this.__MediaPool := NTMS_MEDIAPOOLINFORMATION(this.ptr + 248)
            return this.__MediaPool
        }
    }

    /**
     * @type {NTMS_MEDIATYPEINFORMATION}
     */
    MediaType{
        get {
            if(!this.HasProp("__MediaType"))
                this.__MediaType := NTMS_MEDIATYPEINFORMATION(this.ptr + 248)
            return this.__MediaType
        }
    }

    /**
     * @type {NTMS_I1_LIBREQUESTINFORMATIONA}
     */
    LibRequest{
        get {
            if(!this.HasProp("__LibRequest"))
                this.__LibRequest := NTMS_I1_LIBREQUESTINFORMATIONA(this.ptr + 248)
            return this.__LibRequest
        }
    }

    /**
     * @type {NTMS_I1_OPREQUESTINFORMATIONA}
     */
    OpRequest{
        get {
            if(!this.HasProp("__OpRequest"))
                this.__OpRequest := NTMS_I1_OPREQUESTINFORMATIONA(this.ptr + 248)
            return this.__OpRequest
        }
    }
}
