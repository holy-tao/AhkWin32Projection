#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_FOREST_TRUST_SCANNER_INFO.ahk" { LSA_FOREST_TRUST_SCANNER_INFO }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\LSA_FOREST_TRUST_RECORD_TYPE.ahk" { LSA_FOREST_TRUST_RECORD_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_FOREST_TRUST_BINARY_DATA.ahk" { LSA_FOREST_TRUST_BINARY_DATA }
#Import ".\LSA_FOREST_TRUST_DOMAIN_INFO.ahk" { LSA_FOREST_TRUST_DOMAIN_INFO }
#Import "..\..\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_RECORD2 {
    #StructPack 8


    struct _ForestTrustData {
        TopLevelName : LSA_UNICODE_STRING

        static __New() {
            DefineProp(this.Prototype, 'DomainInfo', { type: LSA_FOREST_TRUST_DOMAIN_INFO, offset: 0 })
            DefineProp(this.Prototype, 'BinaryData', { type: LSA_FOREST_TRUST_BINARY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'ScannerInfo', { type: LSA_FOREST_TRUST_SCANNER_INFO, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Flags : UInt32

    ForestTrustType : LSA_FOREST_TRUST_RECORD_TYPE

    Time : Int64

    ForestTrustData : LSA_FOREST_TRUST_RECORD2._ForestTrustData

}
