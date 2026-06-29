#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Exposes a method that obtains a thumbnail representation of an HTML wallpaper.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-ithumbnailcapture
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IThumbnailCapture extends IUnknown {
    /**
     * The interface identifier for IThumbnailCapture
     * @type {Guid}
     */
    static IID := Guid("{4ea39266-7211-409f-b622-f63dbd16c533}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IThumbnailCapture interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CaptureThumbnail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IThumbnailCapture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a thumbnail representation of an IHTMLDocument2 document.
     * @param {Pointer<SIZE>} pMaxSize Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that specifies the maximum size of the bitmap, in pixels.
     * @param {IUnknown} pHTMLDoc2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/dotnet/api/mshtml.ihtmldocument2?view=powershellsdk-1.1.0&preserve-view=true">IHTMLDocument2</a> interface's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * A handle to a bitmap that represents the document object.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ithumbnailcapture-capturethumbnail
     */
    CaptureThumbnail(pMaxSize, pHTMLDoc2) {
        phbmThumbnail := HBITMAP.Owned()
        result := ComCall(3, this, SIZE.Ptr, pMaxSize, "ptr", pHTMLDoc2, HBITMAP.Ptr, phbmThumbnail, "HRESULT")
        return phbmThumbnail
    }

    Query(iid) {
        if (IThumbnailCapture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CaptureThumbnail := CallbackCreate(GetMethod(implObj, "CaptureThumbnail"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CaptureThumbnail)
    }
}
