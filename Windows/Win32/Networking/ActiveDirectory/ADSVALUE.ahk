#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADS_OCTET_STRING.ahk" { ADS_OCTET_STRING }
#Import ".\ADS_DN_WITH_BINARY.ahk" { ADS_DN_WITH_BINARY }
#Import ".\ADS_DN_WITH_STRING.ahk" { ADS_DN_WITH_STRING }
#Import ".\ADS_TYPEDNAME.ahk" { ADS_TYPEDNAME }
#Import ".\ADS_FAXNUMBER.ahk" { ADS_FAXNUMBER }
#Import ".\ADS_OCTET_LIST.ahk" { ADS_OCTET_LIST }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\ADS_PROV_SPECIFIC.ahk" { ADS_PROV_SPECIFIC }
#Import ".\ADS_CASEIGNORE_LIST.ahk" { ADS_CASEIGNORE_LIST }
#Import ".\ADS_HOLD.ahk" { ADS_HOLD }
#Import ".\ADS_PATH.ahk" { ADS_PATH }
#Import ".\ADS_NT_SECURITY_DESCRIPTOR.ahk" { ADS_NT_SECURITY_DESCRIPTOR }
#Import ".\ADSTYPE.ahk" { ADSTYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_NETADDRESS.ahk" { ADS_NETADDRESS }
#Import ".\ADS_TIMESTAMP.ahk" { ADS_TIMESTAMP }
#Import ".\ADS_POSTALADDRESS.ahk" { ADS_POSTALADDRESS }
#Import ".\ADS_BACKLINK.ahk" { ADS_BACKLINK }
#Import ".\ADS_EMAIL.ahk" { ADS_EMAIL }
#Import ".\ADS_REPLICAPOINTER.ahk" { ADS_REPLICAPOINTER }

/**
 * Contains a value specified as an ADSI data type.
 * @remarks
 * Members of the <b>ADSVALUE</b> structure specify the data type of attributes. For more information and a code example, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-adsvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADSVALUE {
    #StructPack 8

    /**
     * Data type used to interpret the union member of the structure. Values of this member are taken from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration.
     */
    dwType : ADSTYPE

    DNString : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'CaseExactString', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'CaseIgnoreString', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'PrintableString', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'NumericString', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'Boolean', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'Integer', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'OctetString', { type: ADS_OCTET_STRING, offset: 8 })
        DefineProp(this.Prototype, 'UTCTime', { type: SYSTEMTIME, offset: 8 })
        DefineProp(this.Prototype, 'LargeInteger', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'ClassName', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'ProviderSpecific', { type: ADS_PROV_SPECIFIC, offset: 8 })
        DefineProp(this.Prototype, 'pCaseIgnoreList', { type: ADS_CASEIGNORE_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pOctetList', { type: ADS_OCTET_LIST.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pPath', { type: ADS_PATH.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pPostalAddress', { type: ADS_POSTALADDRESS.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'Timestamp', { type: ADS_TIMESTAMP, offset: 8 })
        DefineProp(this.Prototype, 'BackLink', { type: ADS_BACKLINK, offset: 8 })
        DefineProp(this.Prototype, 'pTypedName', { type: ADS_TYPEDNAME.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'Hold', { type: ADS_HOLD, offset: 8 })
        DefineProp(this.Prototype, 'pNetAddress', { type: ADS_NETADDRESS.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pReplicaPointer', { type: ADS_REPLICAPOINTER.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pFaxNumber', { type: ADS_FAXNUMBER.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'Email', { type: ADS_EMAIL, offset: 8 })
        DefineProp(this.Prototype, 'SecurityDescriptor', { type: ADS_NT_SECURITY_DESCRIPTOR, offset: 8 })
        DefineProp(this.Prototype, 'pDNWithBinary', { type: ADS_DN_WITH_BINARY.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pDNWithString', { type: ADS_DN_WITH_STRING.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
