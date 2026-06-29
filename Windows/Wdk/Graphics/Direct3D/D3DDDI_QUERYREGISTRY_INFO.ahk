#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_QUERYREGISTRY_TYPE.ahk" { D3DDDI_QUERYREGISTRY_TYPE }
#Import ".\D3DDDI_QUERYREGISTRY_STATUS.ahk" { D3DDDI_QUERYREGISTRY_STATUS }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_QUERYREGISTRY_INFO {
    #StructPack 8

    QueryType : D3DDDI_QUERYREGISTRY_TYPE

    QueryFlags : IntPtr

    ValueName : WCHAR[260]

    ValueType : UInt32

    PhysicalAdapterIndex : UInt32

    OutputValueSize : UInt32

    Status : D3DDDI_QUERYREGISTRY_STATUS

    OutputDword : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OutputQword', { type: Int64, offset: 552 })
        DefineProp(this.Prototype, 'OutputString', { type: WCHAR[1], offset: 552 })
        DefineProp(this.Prototype, 'OutputBinary', { type: Int8[1], offset: 552 })
        this.DeleteProp("__New")
    }
}
