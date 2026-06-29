#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CONFIG_CI_PROV_INFO_RESULT2.ahk" { CONFIG_CI_PROV_INFO_RESULT2 }
#Import ".\CONFIG_CI_PROV_INFO_RESULT.ahk" { CONFIG_CI_PROV_INFO_RESULT }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CONFIG_CI_PROV_INFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwPolicies : UInt32

    pPolicies : CRYPT_INTEGER_BLOB.Ptr

    result : CONFIG_CI_PROV_INFO_RESULT

    dwScenario : UInt32

    result2 : CONFIG_CI_PROV_INFO_RESULT2.Ptr

}
