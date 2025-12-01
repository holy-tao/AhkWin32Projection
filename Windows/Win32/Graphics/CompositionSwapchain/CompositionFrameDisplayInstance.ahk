#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\PresentationTransform.ahk

/**
 * Represents a single instance of the content shown on a single output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ns-presentation-compositionframedisplayinstance
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
     * Type: **[CompositionFrameInstanceKind](ne-presentation-compositionframeinstancekind.md)**
     * 
     * The kind of instance.
     * @type {Integer}
     */
    instanceKind {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: **[PresentationTransform](../presentationtypes/ns-presentationtypes-presentationtransform.md)**
     * 
     * The accumulated transform on screen of displayed content, including all transforms of ancestor visuals, if applicable.
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
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if a copy took place to display this instance due to the destination being a different adapter than the allocation's adapter; otherwise, `FALSE`.
     * @type {Integer}
     */
    requiredCrossAdapterCopy {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * Type: **[DXGI_COLOR_SPACE_TYPE](/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type)**
     * 
     * The color space type of the output this instance was shown on.
     * @type {Integer}
     */
    colorSpace {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
