#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION_WITH_SOURCE.ahk
#Include .\D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE3.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3 extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hDevice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PlaneCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Pointer<D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE3>>}
     */
    ppOverlayPlanes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PostCompositionCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Pointer<D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION_WITH_SOURCE>>}
     */
    ppPostComposition {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    Supported {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    ReturnInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
