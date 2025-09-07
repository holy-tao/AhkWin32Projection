#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Describes the creation parameters for a device.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevice-creation-parameters
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVICE_CREATION_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Ordinal number that denotes the display adapter. D3DADAPTER\_DEFAULT is always the primary display adapter. Use this ordinal as the Adapter parameter for any of the [**IDirect3D9**](/windows/desktop/api) methods. Note that different instances of Direct3D 9.0 objects can use different ordinals. Adapters can enter or leave a system when users, for example, add or remove monitors from a multiple-monitor system or when they hot-swap a laptop. Consequently, use this ordinal only in a Direct3D 9.0 instance known to be valid, that is, either the Direct3D 9.0 that created this [**IDirect3DDevice9**](/windows/desktop/api) interface or the Direct3D 9.0 returned from [**GetDirect3D**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-getdirect3d), as called through this **IDirect3DDevice9** interface.
     * @type {Integer}
     */
    AdapterOrdinal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**D3DDEVTYPE**](./d3ddevtype.md)**
     * 
     * 
     * Member of the [**D3DDEVTYPE**](./d3ddevtype.md) enumerated type. Denotes the amount of emulated functionality for this device. The value of this parameter mirrors the value passed to the [**CreateDevice**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice) call that created this device.
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[**HWND**](../winprog/windows-data-types.md)**
     * 
     * 
     * Window handle to which focus belongs for this Direct3D device. The value of this parameter mirrors the value passed to the [**CreateDevice**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice) call that created this device.
     * @type {HWND}
     */
    hFocusWindow{
        get {
            if(!this.HasProp("__hFocusWindow"))
                this.__hFocusWindow := HWND(this.ptr + 8)
            return this.__hFocusWindow
        }
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * A combination of one or more [D3DCREATE](d3dcreate.md) constants that control global behavior of the device. These constants mirror the constants passed to [**CreateDevice**](/windows/win32/api/d3d9/nf-d3d9-idirect3d9-createdevice) when the device was created.
     * @type {Integer}
     */
    BehaviorFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
