#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RESULT_VIEW_TYPE_INFO structure is introduced in MMC 2.0.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-result_view_type_info
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class RESULT_VIEW_TYPE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Snap-in-provided identifier for this view type. When implementing <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent2-getresultviewtype2">IComponent2::GetResultViewType2</a>, this member must contain a valid view description string; otherwise, MMC will not initialize your snap-in. Additionally, this value must be created by means of <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. It will be freed by MMC, not the snap-in.
     * @type {Pointer<Char>}
     */
    pstrPersistableViewDescription {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    eViewType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value that specifies whether the view contains list views. If this value is <b>RVTI_MISC_OPTIONS_NOLISTVIEWS</b>, no list views are contained in the view (the console refrains from presenting standard list view choices on the <b>View</b> menu). Otherwise, this value is zero.
     * @type {Integer}
     */
    dwMiscOptions {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwListOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwHTMLOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    pstrURL {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwOCXOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pUnkControl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
