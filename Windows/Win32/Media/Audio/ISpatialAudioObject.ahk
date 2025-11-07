#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectBase.ahk

/**
 * Represents an object that provides audio data to be rendered from a position in 3D space, relative to the user.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObject extends ISpatialAudioObjectBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObject
     * @type {Guid}
     */
    static IID => Guid("{dde28967-521b-46e5-8f00-bd6f2bc8ab1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPosition", "SetVolume"]

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobject-setposition
     */
    SetPosition(x, y, z) {
        result := ComCall(7, this, "float", x, "float", y, "float", z, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} volume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobject-setvolume
     */
    SetVolume(volume) {
        result := ComCall(8, this, "float", volume, "HRESULT")
        return result
    }
}
