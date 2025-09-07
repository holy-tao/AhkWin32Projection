#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the capabilities of a biometric storage adapter.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-storage-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_STORAGE_SCHEMA extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * The type of biometric measurement saved in the database.
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A GUID that identifies the database.
     * @type {Pointer<Guid>}
     */
    DatabaseId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A GUID that identifies the format of the templates in the database.
     * @type {Pointer<Guid>}
     */
    DataFormat {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Information about the characteristics of the database. This can be a bitwise **OR** of the following constants.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                              | Meaning                                                             |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
     * | <span id="WINBIO_DATABASE_FLAG_MASK"></span><span id="winbio_database_flag_mask"></span><dl> <dt>**WINBIO\_DATABASE\_FLAG\_MASK**</dt> <dt>0xFFFF0000</dt> </dl>                | Represents a mask for the flag bits.<br/>                     |
     * | <span id="WINBIO_DATABASE_FLAG_REMOTE"></span><span id="winbio_database_flag_remote"></span><dl> <dt>**WINBIO\_DATABASE\_FLAG\_REMOTE**</dt> <dt>0x00020000</dt> </dl>          | The database resides on a remote computer.<br/>               |
     * | <span id="WINBIO_DATABASE_FLAG_REMOVABLE"></span><span id="winbio_database_flag_removable"></span><dl> <dt>**WINBIO\_DATABASE\_FLAG\_REMOVABLE**</dt> <dt>0x00010000</dt> </dl> | The database resides on a removable drive.<br/>               |
     * | <span id="WINBIO_DATABASE_TYPE_DBMS"></span><span id="winbio_database_type_dbms"></span><dl> <dt>**WINBIO\_DATABASE\_TYPE\_DBMS**</dt> <dt>0x00000002</dt> </dl>                | The database is managed by a database management system.<br/> |
     * | <span id="WINBIO_DATABASE_TYPE_FILE"></span><span id="winbio_database_type_file"></span><dl> <dt>**WINBIO\_DATABASE\_TYPE\_FILE**</dt> <dt>0x00000001</dt> </dl>                | The database is contained in a file.<br/>                     |
     * | <span id="WINBIO_DATABASE_TYPE_MASK"></span><span id="winbio_database_type_mask"></span><dl> <dt>**WINBIO\_DATABASE\_TYPE\_MASK**</dt> <dt>0x0000FFFF</dt> </dl>                | Represents a mask for the type bits.<br/>                     |
     * | <span id="WINBIO_DATABASE_TYPE_ONCHIP"></span><span id="winbio_database_type_onchip"></span><dl> <dt>**WINBIO\_DATABASE\_TYPE\_ONCHIP**</dt> <dt>0x00000003</dt> </dl>          | The database resides on the biometric sensor.<br/>            |
     * | <span id="WINBIO_DATABASE_TYPE_SMARTCARD"></span><span id="winbio_database_type_smartcard"></span><dl> <dt>**WINBIO\_DATABASE\_TYPE\_SMARTCARD**</dt> <dt>0x00000004</dt> </dl> | The database resides on a smart card.<br/>                    |
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The path and file name of the database if it resides on the computer disk.
     * @type {Array<UInt16>}
     */
    FilePath{
        get {
            if(!this.HasProp("__FilePathProxyArray"))
                this.__FilePathProxyArray := Win32FixedArray(this.ptr + 28, 2, Primitive, "ushort")
            return this.__FilePathProxyArray
        }
    }

    /**
     * A string value that can be sent to a database server to identify the database.
     * @type {Array<UInt16>}
     */
    ConnectionString{
        get {
            if(!this.HasProp("__ConnectionStringProxyArray"))
                this.__ConnectionStringProxyArray := Win32FixedArray(this.ptr + 540, 2, Primitive, "ushort")
            return this.__ConnectionStringProxyArray
        }
    }
}
