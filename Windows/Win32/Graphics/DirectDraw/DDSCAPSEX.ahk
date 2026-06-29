#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSCAPSEX {
    #StructPack 4

    dwCaps2 : UInt32

    dwCaps3 : UInt32

    dwCaps4 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dwVolumeDepth', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
