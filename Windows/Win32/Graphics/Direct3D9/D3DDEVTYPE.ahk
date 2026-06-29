#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines device types.
 * @remarks
 * All methods of the [**IDirect3D9**](/windows/win32/api/d3d9helper/nn-d3d9helper-idirect3d9) interface that take a **D3DDEVTYPE** device type will fail if D3DDEVTYPE\_NULLREF is specified. To use these methods, substitute D3DDEVTYPE\_REF in the method call.
 * 
 * A D3DDEVTYPE\_REF device should be created in D3DPOOL\_SCRATCH memory, unless vertex and index buffers are required. To support vertex and index buffers, create the device in D3DPOOL\_SYSTEMMEM memory.
 * 
 * If D3dref9.dll is installed, Direct3D will use the reference rasterizer to create a D3DDEVTYPE\_REF device type, even if D3DDEVTYPE\_NULLREF is specified. If D3dref9.dll is not available and D3DDEVTYPE\_NULLREF is specified, Direct3D will neither render nor present the scene.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevtype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_HAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_REF => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_SW => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_NULLREF => 4
}
