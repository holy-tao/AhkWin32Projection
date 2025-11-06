#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Base interface that provides methods for controlling a spatial audio object render stream, including starting, stopping, and resetting the stream.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamBase
     * @type {Guid}
     */
    static IID => Guid("{feaaf403-c1d8-450d-aa05-e0ccee7502a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableDynamicObjectCount", "GetService", "Start", "Stop", "Reset", "BeginUpdatingAudioObjects", "EndUpdatingAudioObjects"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getavailabledynamicobjectcount
     */
    GetAvailableDynamicObjectCount() {
        result := ComCall(3, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-getservice
     */
    GetService(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &service := 0, "HRESULT")
        return service
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-start
     */
    Start() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-stop
     */
    Stop() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} availableDynamicObjectCount 
     * @param {Pointer<Integer>} frameCountPerBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects
     */
    BeginUpdatingAudioObjects(availableDynamicObjectCount, frameCountPerBuffer) {
        availableDynamicObjectCountMarshal := availableDynamicObjectCount is VarRef ? "uint*" : "ptr"
        frameCountPerBufferMarshal := frameCountPerBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, availableDynamicObjectCountMarshal, availableDynamicObjectCount, frameCountPerBufferMarshal, frameCountPerBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects
     */
    EndUpdatingAudioObjects() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
