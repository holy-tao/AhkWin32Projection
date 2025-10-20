#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory4 extends IUnknown{
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
     * 
     * @param {PWSTR} keySystem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateContentDecryptionModuleFactory(keySystem, riid, ppvObject) {
        keySystem := keySystem is String ? StrPtr(keySystem) : keySystem

        result := ComCall(3, this, "ptr", keySystem, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
