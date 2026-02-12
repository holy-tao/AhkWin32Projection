#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the CreateContentDecryptionModuleFactory method for creating an instance of IMFContentDecryptionModuleFactory, a class factory for Content Decryption Module (CDM) objects for a specified key system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactory4
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
     * Creates an instance of IMFContentDecryptionModuleFactory, a class factory for Content Decryption Module (CDM) objects for a specified key system.
     * @param {PWSTR} keySystem An LPWSTR identifying the Key System for which the interface is created.
     * @param {Pointer<Guid>} riid The IID of the **IMFContentDecryptionModuleFactory** interface to create.
     * @returns {Pointer<Void>} Receives a pointer to the created interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory4-createcontentdecryptionmodulefactory
     */
    CreateContentDecryptionModuleFactory(keySystem, riid) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(3, this, "ptr", keySystem, "ptr", riid, "ptr*", &ppvObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObject
    }
}
