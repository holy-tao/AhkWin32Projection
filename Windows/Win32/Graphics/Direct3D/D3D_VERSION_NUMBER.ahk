#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_VERSION_NUMBER {
    #StructPack 8

    Version : Int64

    static __New() {
        DefineProp(this.Prototype, 'VersionParts', { type: UInt16[4], offset: 0 })
        this.DeleteProp("__New")
    }
}
