#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Predefined sets of pipeline state used by state blocks (see State Blocks Save and Restore State (Direct3D 9)).
 * @remarks
 * As the following diagram shows, vertex and pixel state are both subsets of device state.
 * 
 * ![diagram of device state, with vertex state and pixel state as subsets](images/statesets.png)
 * 
 * There are only a few states that are considered both vertex and pixel state. These states are:
 * 
 * -   Render state: D3DRS\_FOGDENSITY
 * -   Render state: D3DRS\_FOGSTART
 * -   Render state: D3DRS\_FOGEND
 * -   Texture state: D3DTSS\_TEXCOORDINDEX
 * -   Texture state: D3DTSS\_TEXTURETRANSFORMFLAGS
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3d9/d3dstateblocktype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSTATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dlstLightStateType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    drstRenderStateType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwArg{
        get {
            if(!this.HasProp("__dwArgProxyArray"))
                this.__dwArgProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__dwArgProxyArray
        }
    }

    /**
     * @type {Array<Single>}
     */
    dvArg{
        get {
            if(!this.HasProp("__dvArgProxyArray"))
                this.__dvArgProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "float")
            return this.__dvArgProxyArray
        }
    }
}
