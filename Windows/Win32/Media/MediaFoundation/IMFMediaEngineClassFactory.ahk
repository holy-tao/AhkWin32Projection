#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEngine.ahk
#Include .\IMFMediaTimeRange.ahk
#Include .\IMFMediaError.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the Media Engine.
 * @remarks
 * 
 * Before using this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>.
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The class identifier is <b>CLSID_MFMediaEngineClassFactory</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{4d645ace-26aa-4688-9be1-df3516990b93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateTimeRange", "CreateError"]

    /**
     * Creates a new instance of the Media Engine.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_createflags">MF_MEDIA_ENGINE_CREATEFLAGS</a> enumeration.
     * @param {IMFAttributes} pAttr A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. 
     * 
     * This parameter  specifies configuration attributes for the Media Engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> to create the attribute store. Then, set one or more attributes from the list of <a href="https://docs.microsoft.com/windows/desktop/medfound/media-engine-attributes">Media Engine Attributes</a>. For details, see Remarks.
     * @returns {IMFMediaEngine} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppPlayer := 0, "HRESULT")
        return IMFMediaEngine(ppPlayer)
    }

    /**
     * Creates a time range object.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createtimerange
     */
    CreateTimeRange() {
        result := ComCall(4, this, "ptr*", &ppTimeRange := 0, "HRESULT")
        return IMFMediaTimeRange(ppTimeRange)
    }

    /**
     * Creates a media error object.
     * @returns {IMFMediaError} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaerror">IMFMediaError</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createerror
     */
    CreateError() {
        result := ComCall(5, this, "ptr*", &ppError := 0, "HRESULT")
        return IMFMediaError(ppError)
    }
}
