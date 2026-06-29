#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DQUERYTYPE.ahk" { D3DQUERYTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2CREATEQUERY {
    #StructPack 4

    dwQueryID : UInt32

    QueryType : D3DQUERYTYPE

}
