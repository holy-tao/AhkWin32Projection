#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMDT_TEXT_RENDERING_FORMAT.ahk" { D3DKMDT_TEXT_RENDERING_FORMAT }
#Import ".\D3DKMDT_VIDPN_SOURCE_MODE_TYPE.ahk" { D3DKMDT_VIDPN_SOURCE_MODE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_SOURCE_MODE {
    #StructPack 8


    struct _Format {
        Graphics : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'Text', { type: D3DKMDT_TEXT_RENDERING_FORMAT, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Id : UInt32

    Type : D3DKMDT_VIDPN_SOURCE_MODE_TYPE

    Format : D3DKMDT_VIDPN_SOURCE_MODE._Format

}
