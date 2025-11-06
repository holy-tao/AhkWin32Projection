#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory4
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactory4
     * @type {Guid}
     */
    static IID => Guid("{fbe256c1-43cf-4a9b-8cb8-ce8632a34186}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateContentDecryptionModuleFactory"]

    /**
     * 
     * @param {PWSTR} keySystem 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory4-createcontentdecryptionmodulefactory
     */
    CreateContentDecryptionModuleFactory(keySystem, riid) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(3, this, "ptr", keySystem, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }
}
