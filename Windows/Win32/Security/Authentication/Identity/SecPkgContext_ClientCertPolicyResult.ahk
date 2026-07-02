#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_ClientCertPolicyResult {
    #StructPack 4

    dwPolicyResult : HRESULT

    guidPolicyId : Guid

}
