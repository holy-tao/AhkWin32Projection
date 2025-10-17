#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\PresentationTransform.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class CompositionFrameDisplayInstance extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {LUID}
     */
    displayAdapterLUID{
        get {
            if(!this.HasProp("__displayAdapterLUID"))
                this.__displayAdapterLUID := LUID(0, this)
            return this.__displayAdapterLUID
        }
    }

    /**
     * @type {Integer}
     */
    displayVidPnSourceId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    displayUniqueId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {LUID}
     */
    renderAdapterLUID{
        get {
            if(!this.HasProp("__renderAdapterLUID"))
                this.__renderAdapterLUID := LUID(16, this)
            return this.__renderAdapterLUID
        }
    }

    /**
     * @type {Integer}
     */
    instanceKind {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {PresentationTransform}
     */
    finalTransform{
        get {
            if(!this.HasProp("__finalTransform"))
                this.__finalTransform := PresentationTransform(32, this)
            return this.__finalTransform
        }
    }

    /**
     * @type {Integer}
     */
    requiredCrossAdapterCopy {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    colorSpace {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
