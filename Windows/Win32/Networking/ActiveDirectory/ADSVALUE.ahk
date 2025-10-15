#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADS_OCTET_STRING.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\ADS_PROV_SPECIFIC.ahk
#Include .\ADS_TIMESTAMP.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\ADS_BACKLINK.ahk
#Include .\ADS_HOLD.ahk
#Include .\ADS_EMAIL.ahk
#Include .\ADS_NT_SECURITY_DESCRIPTOR.ahk

/**
 * Contains a value specified as an ADSI data type.
 * @remarks
 * 
  * Members of the <b>ADSVALUE</b> structure specify the data type of attributes. For more information and a code example, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-adsvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADSVALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Data type used to interpret the union member of the structure. Values of this member are taken from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    DNString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    CaseExactString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    CaseIgnoreString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    PrintableString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    NumericString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Boolean {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Integer {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {ADS_OCTET_STRING}
     */
    OctetString{
        get {
            if(!this.HasProp("__OctetString"))
                this.__OctetString := ADS_OCTET_STRING(this.ptr + 8)
            return this.__OctetString
        }
    }

    /**
     * @type {SYSTEMTIME}
     */
    UTCTime{
        get {
            if(!this.HasProp("__UTCTime"))
                this.__UTCTime := SYSTEMTIME(this.ptr + 8)
            return this.__UTCTime
        }
    }

    /**
     * @type {Integer}
     */
    LargeInteger {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    ClassName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {ADS_PROV_SPECIFIC}
     */
    ProviderSpecific{
        get {
            if(!this.HasProp("__ProviderSpecific"))
                this.__ProviderSpecific := ADS_PROV_SPECIFIC(this.ptr + 8)
            return this.__ProviderSpecific
        }
    }

    /**
     * @type {Pointer<ADS_CASEIGNORE_LIST>}
     */
    pCaseIgnoreList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_OCTET_LIST>}
     */
    pOctetList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_PATH>}
     */
    pPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_POSTALADDRESS>}
     */
    pPostalAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {ADS_TIMESTAMP}
     */
    Timestamp{
        get {
            if(!this.HasProp("__Timestamp"))
                this.__Timestamp := ADS_TIMESTAMP(this.ptr + 8)
            return this.__Timestamp
        }
    }

    /**
     * @type {ADS_BACKLINK}
     */
    BackLink{
        get {
            if(!this.HasProp("__BackLink"))
                this.__BackLink := ADS_BACKLINK(this.ptr + 8)
            return this.__BackLink
        }
    }

    /**
     * @type {Pointer<ADS_TYPEDNAME>}
     */
    pTypedName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {ADS_HOLD}
     */
    Hold{
        get {
            if(!this.HasProp("__Hold"))
                this.__Hold := ADS_HOLD(this.ptr + 8)
            return this.__Hold
        }
    }

    /**
     * @type {Pointer<ADS_NETADDRESS>}
     */
    pNetAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_REPLICAPOINTER>}
     */
    pReplicaPointer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_FAXNUMBER>}
     */
    pFaxNumber {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {ADS_EMAIL}
     */
    Email{
        get {
            if(!this.HasProp("__Email"))
                this.__Email := ADS_EMAIL(this.ptr + 8)
            return this.__Email
        }
    }

    /**
     * @type {ADS_NT_SECURITY_DESCRIPTOR}
     */
    SecurityDescriptor{
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := ADS_NT_SECURITY_DESCRIPTOR(this.ptr + 8)
            return this.__SecurityDescriptor
        }
    }

    /**
     * @type {Pointer<ADS_DN_WITH_BINARY>}
     */
    pDNWithBinary {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<ADS_DN_WITH_STRING>}
     */
    pDNWithString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
