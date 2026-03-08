#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISurfacePresenterFlip extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurfacePresenterFlip
     * @type {Guid}
     */
    static IID => Guid("{30510848-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "GetBuffer"]

    /**
     * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix. (PresentationTransform)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ns-presentationtypes-presentationtransform
     */
    Present() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
     * @remarks
     * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
     * @param {Integer} backBufferIndex 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpaintbits
     */
    GetBuffer(backBufferIndex, riid) {
        result := ComCall(4, this, "uint", backBufferIndex, "ptr", riid, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }
}
