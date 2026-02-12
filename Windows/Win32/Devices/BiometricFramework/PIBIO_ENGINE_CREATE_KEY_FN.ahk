#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by the Windows Biometric Framework to push an HMAC key to the sensor. The returned key identifier will be passed back to the biometric unit when the framework calls EngineAdapterIdentifyFeatureSetSecure.
 * @remarks
 * Only a single key will be in use at any time. If <b>EngineAdapterCreateKey</b> is called when the engine has knowledge of a preexisting key, the preexisting key must be overwritten with the new one.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_CREATE_KEY_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<Integer>} Key 
     * @param {Pointer} KeySize 
     * @param {Pointer} KeyIdentifier 
     * @param {Pointer} KeyIdentifierSize 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Key, KeySize, KeyIdentifier, KeyIdentifierSize) {
        KeyMarshal := Key is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, KeyMarshal, Key, "ptr", KeySize, "ptr", KeyIdentifier, "ptr", KeyIdentifierSize, "ptr*", &ResultSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResultSize
    }
}
