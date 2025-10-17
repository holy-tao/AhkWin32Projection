#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PIN_CACHE_POLICY.ahk

/**
 * The PIN_INFO structure contains information about a pin.
 * @remarks
 * 
  * If the name of an output pin begins with a tilde (~), the filter graph manager ignores the pin when it builds a graph. During a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a>, if the pin appears on an intermediate filter, the filter graph manager does not render the pin. However, it renders the pin if you explicitly pass the pin to the <b>Connect</b> or <b>Render</b> method.
  * 
  * Use a tilde if the pin delivers a secondary stream that should not be rendered by default, or if the pin requires special code to render correctly. For example, DVD filters should use it for pins that deliver subpicture or closed captioning data. Video capture filters should use it for capture pins (but not preview pins).
  * 
  * The <b>pFilter</b> member has an outstanding reference count. The application must release the interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-pin_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PIN_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PinType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PinPurpose {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwChangePermission {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwUnblockPermission {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PIN_CACHE_POLICY}
     */
    PinCachePolicy{
        get {
            if(!this.HasProp("__PinCachePolicy"))
                this.__PinCachePolicy := PIN_CACHE_POLICY(24, this)
            return this.__PinCachePolicy
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
