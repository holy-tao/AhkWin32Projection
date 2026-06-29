#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_PRESENT_MODEL.ahk" { D3DKMT_PRESENT_MODEL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENTHISTORYTOKEN {
    #StructPack 8


    struct _Token {
        Flip : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'Blt', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'VistaBlt', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'Gdi', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'Fence', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'GdiSysMem', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'Composition', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'FlipManager', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'SurfaceComplete', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Model : D3DKMT_PRESENT_MODEL

    TokenSize : UInt32

    CompositionBindingId : Int64

    Token : D3DKMT_PRESENTHISTORYTOKEN._Token

}
