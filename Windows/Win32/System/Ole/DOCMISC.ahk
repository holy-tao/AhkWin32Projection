#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides miscellaneous property information about a document object.
 * @remarks
 * Objects that have a limited user interface for activation purposes should set DOCMISC_CANTOPENEDIT. Those that support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a> only as a persistence mechanism should specify DOCMISC_NOFILESUPPORT. Otherwise, an object must also implement <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a>.
 * 
 * A combination of values from <b>DOCMISC</b> is returned at the location specified by the <i>pdwStatus</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocument-getdocmiscstatus">IOleDocument::GetDocMiscStatus</a>.
 * 
 * If an object requires none of these flags, it must write a zero to the <i>pdwStatus</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-docmisc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DOCMISC extends Win32Enum{

    /**
     * Object supports multiple views.
     * @type {Integer (Int32)}
     */
    static DOCMISC_CANCREATEMULTIPLEVIEWS => 1

    /**
     * Object supports complex rectangles and therefore implements <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-setrectcomplex">IOleDocumentView::SetRectComplex</a>.
     * @type {Integer (Int32)}
     */
    static DOCMISC_SUPPORTCOMPLEXRECTANGLES => 2

    /**
     * Object supports activation in a separate window and therefore implements <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-ioledocumentview-open">IOleDocumentView::Open</a>.
     * @type {Integer (Int32)}
     */
    static DOCMISC_CANTOPENEDIT => 4

    /**
     * Object does not support file read/write.
     * @type {Integer (Int32)}
     */
    static DOCMISC_NOFILESUPPORT => 8
}
