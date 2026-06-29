#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DCOLORVALUE.ahk" { D3DCOLORVALUE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DMATERIAL {
    #StructPack 4

    dwSize : UInt32

    diffuse : D3DCOLORVALUE

    ambient : D3DCOLORVALUE

    specular : D3DCOLORVALUE

    emissive : D3DCOLORVALUE

    power : Float32

    hTexture : UInt32

    dwRampSize : UInt32

    static __New() {
        DefineProp(this.Prototype, 'dcvDiffuse', { type: D3DCOLORVALUE, offset: 4 })
        DefineProp(this.Prototype, 'dcvAmbient', { type: D3DCOLORVALUE, offset: 20 })
        DefineProp(this.Prototype, 'dcvSpecular', { type: D3DCOLORVALUE, offset: 36 })
        DefineProp(this.Prototype, 'dcvEmissive', { type: D3DCOLORVALUE, offset: 52 })
        DefineProp(this.Prototype, 'dvPower', { type: Float32, offset: 68 })
        this.DeleteProp("__New")
    }
}
