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
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    GetAvailableDynamicObjectCount(value) {
        result := ComCall(3, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} service 
     * @returns {HRESULT} 
     */
    GetService(riid, service) {
        result := ComCall(4, this, "ptr", riid, "ptr", service, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} availableDynamicObjectCount 
     * @param {Pointer<UInt32>} frameCountPerBuffer 
     * @returns {HRESULT} 
     */
    BeginUpdatingAudioObjects(availableDynamicObjectCount, frameCountPerBuffer) {
        result := ComCall(8, this, "uint*", availableDynamicObjectCount, "uint*", frameCountPerBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndUpdatingAudioObjects() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
