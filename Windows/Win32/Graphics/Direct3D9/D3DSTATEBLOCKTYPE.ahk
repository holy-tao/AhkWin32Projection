#Requires AutoHotkey v2.0.0 64-bit

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
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dstateblocktype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSTATEBLOCKTYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSBT_ALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSBT_PIXELSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSBT_VERTEXSTATE => 3
}
