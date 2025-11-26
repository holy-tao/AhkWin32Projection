#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that obtains a thumbnail representation of an HTML wallpaper.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-ithumbnailcapture
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailCapture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailCapture
     * @type {Guid}
     */
    static IID => Guid("{4ea39266-7211-409f-b622-f63dbd16c533}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CaptureThumbnail"]

    /**
     * Retrieves a thumbnail representation of an IHTMLDocument2 document.
     * @param {Pointer<SIZE>} pMaxSize Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that specifies the maximum size of the bitmap, in pixels.
     * @param {IUnknown} pHTMLDoc2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/dotnet/api/mshtml.ihtmldocument2?view=powershellsdk-1.1.0">IHTMLDocument2</a> interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * A handle to a bitmap that represents the document object.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-ithumbnailcapture-capturethumbnail
     */
    CaptureThumbnail(pMaxSize, pHTMLDoc2) {
        phbmThumbnail := HBITMAP()
        result := ComCall(3, this, "ptr", pMaxSize, "ptr", pHTMLDoc2, "ptr", phbmThumbnail, "HRESULT")
        return phbmThumbnail
    }
}
