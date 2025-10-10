#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of storage medium being used in a data transfer. They are used in the STGMEDIUM or FORMATETC structures.
 * @remarks
 * 
  * During data transfer operations, a storage medium is specified. This medium must be released after the data transfer operation. The provider of the medium indicates its choice of ownership scenarios in the value it provides in the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure. A <b>NULL</b> value for the <b>pUnkForRelease</b> member indicates that the receiving body of code owns and can free the medium. A non-<b>NULL</b> pointer specifies that <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-releasestgmedium">ReleaseStgMedium</a> can always be called to free the medium.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-tymed
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TYMED{

    /**
     * The storage medium is a global memory handle (<b>HGLOBAL</b>). Allocate the global handle with the GMEM_MOVEABLE flag. If the <b>punkForRelease</b> member of <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> is <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> to release the memory.
     * @type {Integer (Int32)}
     */
    static TYMED_HGLOBAL => 1

    /**
     * The storage medium is a disk file identified by a path. If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfile">OpenFile</a> to delete the file.
     * @type {Integer (Int32)}
     */
    static TYMED_FILE => 2

    /**
     * The storage medium is a stream object identified by an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer. Use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> to read the data. If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is not <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> to release the stream component.
     * @type {Integer (Int32)}
     */
    static TYMED_ISTREAM => 4

    /**
     * The storage medium is a storage component identified by an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer. The data is in the streams and storages contained by this <b>IStorage</b> instance. If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is not <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> to release the storage component.
     * @type {Integer (Int32)}
     */
    static TYMED_ISTORAGE => 8

    /**
     * The storage medium is a GDI component (<b>HBITMAP</b>). If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> to delete the bitmap.
     * @type {Integer (Int32)}
     */
    static TYMED_GDI => 16

    /**
     * The storage medium is a metafile (<b>HMETAFILE</b>). Use the GDI functions to access the metafile's data. If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletemetafile">DeleteMetaFile</a> to delete the bitmap.
     * @type {Integer (Int32)}
     */
    static TYMED_MFPICT => 32

    /**
     * The storage medium is an enhanced metafile. If the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> <b>punkForRelease</b> member is <b>NULL</b>, the destination process should use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteenhmetafile">DeleteEnhMetaFile</a> to delete the bitmap.
     * @type {Integer (Int32)}
     */
    static TYMED_ENHMF => 64

    /**
     * No data is being passed.
     * @type {Integer (Int32)}
     */
    static TYMED_NULL => 0
}
