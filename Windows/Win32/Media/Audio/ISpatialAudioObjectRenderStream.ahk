#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObject.ahk
#Include .\ISpatialAudioObjectRenderStreamBase.ahk

/**
 * Provides methods for controlling a spatial audio object render stream, including starting, stopping, and resetting the stream.
 * @remarks
 * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase">ISpatialAudioObjectRenderStreamBase</a> interface.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstream
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStream extends ISpatialAudioObjectRenderStreamBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStream
     * @type {Guid}
     */
    static IID => Guid("{bab5f473-b423-477b-85f5-b5a332a04153}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateSpatialAudioObject"]

    /**
     * Activates an ISpatialAudioObject for audio rendering.
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> is one that was activated by setting the <i>type</i> parameter to the  <b>ActivateSpatialAudioObject</b> method to <b>AudioObjectType_Dynamic</b>. The client has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. After the limit has been reached, attempting to activate additional audio objects will result in this method returning an SPTLAUDCLNT_E_NO_MORE_OBJECTS error. To avoid this, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on each dynamic <b>ISpatialAudioObject</b> after it is no longer being used to free up the resource so that it can be reallocated. See <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-isactive">ISpatialAudioObject::IsActive</a> and <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream">ISpatialAudioObject::SetEndOfStream</a> for more information on the managing the lifetime of spatial audio objects.
     * @param {Integer} type The type of audio object to activate. For dynamic audio objects, this value must be <b>AudioObjectType_Dynamic</b>. For static audio objects, specify one of the static audio channel values from the enumeration. Specifying <b>AudioObjectType_None</b> will produce an audio object that is not spatialized.
     * @returns {ISpatialAudioObject} Receives a pointer to the activated interface.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstream-activatespatialaudioobject
     */
    ActivateSpatialAudioObject(type) {
        result := ComCall(10, this, "int", type, "ptr*", &audioObject := 0, "HRESULT")
        return ISpatialAudioObject(audioObject)
    }
}
