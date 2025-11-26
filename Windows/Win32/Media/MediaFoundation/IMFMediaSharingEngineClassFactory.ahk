#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSharingEngine.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFMediaSharingEngine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfmediasharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSharingEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSharingEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{524d2bc4-b2b1-4fe5-8fac-fa4e4512b4e0}")

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
     * Creates an instance of the IMFMediaSharingEngine.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_createflags">MF_MEDIA_ENGINE_CREATEFLAGS</a> enumeration.
     * @param {IMFAttributes} pAttr A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store.
     * @returns {IMFMediaSharingEngine} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/nn-mfsharingengine-imfmediasharingengine">IMFMediaSharingEngine</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nf-mfsharingengine-imfmediasharingengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppEngine := 0, "HRESULT")
        return IMFMediaSharingEngine(ppEngine)
    }
}
