#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the capture engine.
 * @remarks
 * 
 * To get a pointer to this interface, call the <a href="https://docs.microsoft.com/windows/desktop/medfound/using-an-encoder-s-imftransform--interface">CoCreateInstance</a> function and specify the CLSID equal to <b>CLSID_MFCaptureEngineClassFactory</b>. 
 * 
 * Calling the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfcreatecaptureengine">MFCreateCaptureEngine</a> function is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengineclassfactory-createinstance">IMFCaptureEngineClassFactory::CreateInstance</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{8f02d140-56fc-4302-a705-3a97c78be779}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * Creates an instance of the capture engine.
     * @param {Pointer<Guid>} clsid The CLSID of the object to create.
     * 
     * Currently, this parameter must equal <b>CLSID_MFCaptureEngine</b>.
     * @param {Pointer<Guid>} riid The IID of the requested interface. The capture engine supports the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengine">IMFCaptureEngine</a> interface.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengineclassfactory-createinstance
     */
    CreateInstance(clsid, riid) {
        result := ComCall(3, this, "ptr", clsid, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }
}
