#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSpatialAudioObjectBuffer.ahk
#Include .\IMFSample.ahk

/**
 * Represents a multimedia sample with spatial sound information. Every IMFSpatialAudioSample contains one or more IMFSpatialAudioObjectBuffer objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nn-mfspatialaudio-imfspatialaudiosample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSpatialAudioSample extends IMFSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSpatialAudioSample
     * @type {Guid}
     */
    static IID => Guid("{abf28a9b-3393-4290-ba79-5ffc46d986b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectCount", "AddSpatialAudioObject", "GetSpatialAudioObjectByIndex"]

    /**
     * Gets the count of spatial audio objects, represented by IMFSpatialAudioObjectBuffer objects, in the sample.
     * @returns {Integer} A pointer to a 32 bit variable where the total number of audio objects in the sample will be stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(47, this, "uint*", &pdwObjectCount := 0, "HRESULT")
        return pdwObjectCount
    }

    /**
     * Adds a new spatial audio object, represented by an IMFSpatialAudioObjectBuffer object, to the sample.
     * @param {IMFSpatialAudioObjectBuffer} pAudioObjBuffer A pointer to the new IMFSpatialAudioObject.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied pointer is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-addspatialaudioobject
     */
    AddSpatialAudioObject(pAudioObjBuffer) {
        result := ComCall(48, this, "ptr", pAudioObjBuffer, "HRESULT")
        return result
    }

    /**
     * Returns the spatial audio object, represented by an IMFSpatialAudioObjectBuffer object, corresponding to the specified index.
     * @param {Integer} dwIndex A 32 bit variable with the 0-based index of the requested audio object.
     * @returns {IMFSpatialAudioObjectBuffer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfspatialaudio/nn-mfspatialaudio-imfspatialaudioobjectbuffer">IMFSpatialAudioObjectBuffer</a> object in which the spatial audio object corresponding with the specified index will be stored.
     * @see https://docs.microsoft.com/windows/win32/api//mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-getspatialaudioobjectbyindex
     */
    GetSpatialAudioObjectByIndex(dwIndex) {
        result := ComCall(49, this, "uint", dwIndex, "ptr*", &ppAudioObjBuffer := 0, "HRESULT")
        return IMFSpatialAudioObjectBuffer(ppAudioObjBuffer)
    }
}
