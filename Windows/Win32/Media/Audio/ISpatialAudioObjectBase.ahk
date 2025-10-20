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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "SetEndOfStream", "IsActive", "GetAudioObjectType"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @param {Pointer<Integer>} bufferLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getbuffer
     */
    GetBuffer(buffer, bufferLength) {
        result := ComCall(3, this, "ptr*", buffer, "uint*", bufferLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} frameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream
     */
    SetEndOfStream(frameCount) {
        result := ComCall(4, this, "uint", frameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-isactive
     */
    IsActive(isActive) {
        result := ComCall(5, this, "ptr", isActive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} audioObjectType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getaudioobjecttype
     */
    GetAudioObjectType(audioObjectType) {
        result := ComCall(6, this, "int*", audioObjectType, "HRESULT")
        return result
    }
}
