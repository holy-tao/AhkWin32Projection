#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Base interface that represents an object that provides audio data to be rendered from a position in 3D space, relative to the user.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectBase extends IUnknown{
    /**
     * The interface identifier for ISpatialAudioObjectBase
     * @type {Guid}
     */
    static IID => Guid("{cce0b8f2-8d4d-4efb-a8cf-3d6ecf1c30e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} buffer 
     * @param {Pointer<UInt32>} bufferLength 
     * @returns {HRESULT} 
     */
    GetBuffer(buffer, bufferLength) {
        result := ComCall(3, this, "char*", buffer, "uint*", bufferLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} frameCount 
     * @returns {HRESULT} 
     */
    SetEndOfStream(frameCount) {
        result := ComCall(4, this, "uint", frameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isActive 
     * @returns {HRESULT} 
     */
    IsActive(isActive) {
        result := ComCall(5, this, "ptr", isActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} audioObjectType 
     * @returns {HRESULT} 
     */
    GetAudioObjectType(audioObjectType) {
        result := ComCall(6, this, "int*", audioObjectType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
