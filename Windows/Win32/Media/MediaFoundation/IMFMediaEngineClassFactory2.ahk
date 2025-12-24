#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeys.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFMediaKeys object.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactory2
     * @type {Guid}
     */
    static IID => Guid("{09083cef-867f-4bf6-8776-dee3a7b42fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMediaKeys2"]

    /**
     * Creates a media keys object based on the specified key system.
     * @param {BSTR} keySystem The media key system.
     * @param {BSTR} defaultCdmStorePath Points to the default file location for the  store Content Decryption Module (CDM) data.
     * @param {BSTR} inprivateCdmStorePath Points to a the inprivate location for the  store Content Decryption Module (CDM) data. Specifying this path allows the CDM to comply with the application’s privacy policy by putting personal information in the file location indicated by this path.
     * @returns {IMFMediaKeys} Receives the media keys.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory2-createmediakeys2
     */
    CreateMediaKeys2(keySystem, defaultCdmStorePath, inprivateCdmStorePath) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem
        defaultCdmStorePath := defaultCdmStorePath is String ? BSTR.Alloc(defaultCdmStorePath).Value : defaultCdmStorePath
        inprivateCdmStorePath := inprivateCdmStorePath is String ? BSTR.Alloc(inprivateCdmStorePath).Value : inprivateCdmStorePath

        result := ComCall(3, this, "ptr", keySystem, "ptr", defaultCdmStorePath, "ptr", inprivateCdmStorePath, "ptr*", &ppKeys := 0, "HRESULT")
        return IMFMediaKeys(ppKeys)
    }
}
