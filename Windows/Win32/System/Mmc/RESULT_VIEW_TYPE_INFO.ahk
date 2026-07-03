#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\MMC_VIEW_TYPE.ahk" { MMC_VIEW_TYPE }

/**
 * The RESULT_VIEW_TYPE_INFO structure is introduced in MMC 2.0.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-result_view_type_info
 * @namespace Windows.Win32.System.Mmc
 */
export default struct RESULT_VIEW_TYPE_INFO {
    #StructPack 8

    /**
     * Snap-in-provided identifier for this view type. When implementing <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent2-getresultviewtype2">IComponent2::GetResultViewType2</a>, this member must contain a valid view description string; otherwise, MMC will not initialize your snap-in. Additionally, this value must be created by means of <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. It will be freed by MMC, not the snap-in.
     */
    pstrPersistableViewDescription : PWSTR

    eViewType : MMC_VIEW_TYPE

    /**
     * A value that specifies whether the view contains list views. If this value is <b>RVTI_MISC_OPTIONS_NOLISTVIEWS</b>, no list views are contained in the view (the console refrains from presenting standard list view choices on the <b>View</b> menu). Otherwise, this value is zero.
     */
    dwMiscOptions : UInt32

    dwListOptions : UInt32

    pstrURL : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'dwHTMLOptions', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'dwOCXOptions', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'pUnkControl', { type: IUnknown, offset: 24 })
        this.DeleteProp("__New")
    }
}
