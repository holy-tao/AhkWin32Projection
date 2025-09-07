#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The REGPINTYPES structure contains media type information for registering a filter.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltermapper2">IFilterMapper2</a> interface to identify the media types that a pin supports. The equivalent <b>AMOVIESETUP_MEDIATYPE</b> type is used in class factory templates (<a href="https://docs.microsoft.com/windows/desktop/DirectShow/cfactorytemplate">CFactoryTemplate</a>).
  * 
  * To register a range of subtypes within the same major type, use the value MEDIASUBTYPE_NULL.
  * 
  * For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/how-to-register-directshow-filters">How to Register DirectShow Filters</a>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-regpintypes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class REGPINTYPES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Major type GUID of the media type.
     * @type {Pointer<Guid>}
     */
    clsMajorType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Sub type GUID of the media type. Can be MEDIASUBTYPE_NULL.
     * @type {Pointer<Guid>}
     */
    clsMinorType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
