#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of caching requested for newly created objects.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olerender
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLERENDER{

    /**
     * The client is not requesting any locally cached drawing or data retrieval capabilities in the object. The <i>pFormatEtc</i> parameter of the calls is ignored when this value is specified for the <i>renderopts</i> parameter.
     * @type {Integer (Int32)}
     */
    static OLERENDER_NONE => 0

    /**
     * The client will draw the content of the object on the screen (a <b>NULL</b> target device) using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a>. The object itself determines the data formats that need to be cached. With this render option, only the <b>ptd</b> and <b>dwAspect</b> members of <i>pFormatEtc</i> are significant, since the object may cache things differently depending on the parameter values. However, <i>pFormatEtc</i> can legally be <b>NULL</b> here, in which case the object is to assume the display target device and the DVASPECT_CONTENT aspect.
     * @type {Integer (Int32)}
     */
    static OLERENDER_DRAW => 1

    /**
     * The client will pull one format from the object using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. The format of the data to be cached is passed in <i>pFormatEtc</i>, which may not in this case be <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static OLERENDER_FORMAT => 2

    /**
     * The client is not requesting any locally cached drawing or data retrieval capabilities in the object. <i>pFormatEtc</i> is ignored for this option. The difference between this and the OLERENDER_FORMAT value is important in such functions as <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatelinkfromdata">OleCreateLinkFromData</a>.
     * @type {Integer (Int32)}
     */
    static OLERENDER_ASIS => 3
}
