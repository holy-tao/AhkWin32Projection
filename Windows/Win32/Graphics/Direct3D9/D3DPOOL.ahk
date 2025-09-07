#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the memory class that holds the buffers for a resource.
 * @remarks
 * All pool types are valid with all resources including: vertex buffers, index buffers, textures, and surfaces.
  * 
  * The following tables indicate restrictions on pool types for render targets, depth stencils, and dynamic and mipmap usages. An x indicates a compatible combination; lack of an x indicates incompatibility.
  * 
  * 
  * 
  * | Pool               | D3DUSAGE\_RENDERTARGET | D3DUSAGE\_DEPTHSTENCIL |
  * |--------------------|------------------------|------------------------|
  * | D3DPOOL\_DEFAULT   | x                      | x                      |
  * | D3DPOOL\_MANAGED   |                        |                        |
  * | D3DPOOL\_SCRATCH   |                        |                        |
  * | D3DPOOL\_SYSTEMMEM |                        |                        |
  * 
  * 
  * 
  *  
  * 
  * 
  * 
  * | Pool               | D3DUSAGE\_DYNAMIC | D3DUSAGE\_AUTOGENMIPMAP |
  * |--------------------|-------------------|-------------------------|
  * | D3DPOOL\_DEFAULT   | x                 | x                       |
  * | D3DPOOL\_MANAGED   |                   | x                       |
  * | D3DPOOL\_SCRATCH   |                   |                         |
  * | D3DPOOL\_SYSTEMMEM | x                 |                         |
  * 
  * 
  * 
  *  
  * 
  * For more information about usage types, see [**D3DUSAGE**](d3dusage.md).
  * 
  * Pools cannot be mixed for different objects contained within one resource (mip levels in a mipmap) and, when a pool is chosen, it cannot be changed.
  * 
  * Applications should use D3DPOOL\_MANAGED for most static resources because this saves the application from having to deal with lost devices. (Managed resources are restored by the runtime.) This is especially beneficial for unified memory architecture (UMA) systems. Other dynamic resources are not a good match for D3DPOOL\_MANAGED. In fact, index buffers and vertex buffers cannot be created using D3DPOOL\_MANAGED together with D3DUSAGE\_DYNAMIC.
  * 
  * For dynamic textures, it is sometimes desirable to use a pair of video memory and system memory textures, allocating the video memory using D3DPOOL\_DEFAULT and the system memory using D3DPOOL\_SYSTEMMEM. You can lock and modify the bits of the system memory texture using a locking method. Then you can update the video memory texture using [**IDirect3DDevice9::UpdateTexture**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-updatetexture).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dpool
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DPOOL{

    /**
     * @type {Integer (Int32)}
     */
    static D3DPOOL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DPOOL_MANAGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPOOL_SYSTEMMEM => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPOOL_SCRATCH => 3
}
