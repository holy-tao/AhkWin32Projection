#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DCOLORVALUE.ahk" { D3DCOLORVALUE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DMATERIAL7 {
    #StructPack 4

    diffuse : D3DCOLORVALUE

    ambient : D3DCOLORVALUE

    specular : D3DCOLORVALUE

    emissive : D3DCOLORVALUE

    power : Float32

    static __New() {
        DefineProp(this.Prototype, 'dcvDiffuse', { type: D3DCOLORVALUE, offset: 0 })
        DefineProp(this.Prototype, 'dcvAmbient', { type: D3DCOLORVALUE, offset: 16 })
        DefineProp(this.Prototype, 'dcvSpecular', { type: D3DCOLORVALUE, offset: 32 })
        DefineProp(this.Prototype, 'dcvEmissive', { type: D3DCOLORVALUE, offset: 48 })
        DefineProp(this.Prototype, 'dvPower', { type: Float32, offset: 64 })
        this.DeleteProp("__New")
    }
}
