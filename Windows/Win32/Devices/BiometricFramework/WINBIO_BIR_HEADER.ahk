#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_REGISTERED_FORMAT.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bir-header
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BIR_HEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _ValidityPeriod extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        BeginDate {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        EndDate {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
    }

    /**
     * @type {Integer}
     */
    ValidFields {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HeaderVersion {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    PatronHeaderVersion {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    DataFlags {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Subtype {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Purpose {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    DataQuality {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    CreationDate {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {_ValidityPeriod}
     */
    ValidityPeriod{
        get {
            if(!this.HasProp("__ValidityPeriod"))
                this.__ValidityPeriod := %this.__Class%._ValidityPeriod(24, this)
            return this.__ValidityPeriod
        }
    }

    /**
     * @type {WINBIO_REGISTERED_FORMAT}
     */
    BiometricDataFormat{
        get {
            if(!this.HasProp("__BiometricDataFormat"))
                this.__BiometricDataFormat := WINBIO_REGISTERED_FORMAT(40, this)
            return this.__BiometricDataFormat
        }
    }

    /**
     * @type {WINBIO_REGISTERED_FORMAT}
     */
    ProductId{
        get {
            if(!this.HasProp("__ProductId"))
                this.__ProductId := WINBIO_REGISTERED_FORMAT(44, this)
            return this.__ProductId
        }
    }
}
