#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DQUERYTYPE.ahk" { D3DQUERYTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_GETD3DQUERYDATA {
    #StructPack 8

    gdi2 : IntPtr

    dwQueryIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'QueryType', { type: D3DQUERYTYPE, offset: 8 })
        this.DeleteProp("__New")
    }
}
