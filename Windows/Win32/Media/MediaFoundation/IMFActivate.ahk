#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Enables the application to defer the creation of an object.
 * @remarks
 * 
  * Typically, the application calls some function that returns an <b>IMFActivate</b> pointer and then passes that pointer to another component. The other component calls <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a> at a later time to create the object. In the protected media path (PMP), the <b>IMFActivate</b> pointer might be marshaled to the protected process, so that the object can be created in that process.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfactivate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFActivate extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFActivate
     * @type {Guid}
     */
    static IID => Guid("{7fee9e9a-4a89-47a6-899c-b6a53a70fb67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateObject", "ShutdownObject", "DetachObject"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-activateobject
     */
    ActivateObject(riid) {
        result := ComCall(33, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject
     */
    ShutdownObject() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfactivate-detachobject
     */
    DetachObject() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
