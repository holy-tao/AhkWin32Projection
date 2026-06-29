#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSpatialAudioObjectBuffer.ahk" { IMFSpatialAudioObjectBuffer }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a multimedia sample with spatial sound information. Every IMFSpatialAudioSample contains one or more IMFSpatialAudioObjectBuffer objects.
 * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nn-mfspatialaudio-imfspatialaudiosample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSpatialAudioSample extends IMFSample {
    /**
     * The interface identifier for IMFSpatialAudioSample
     * @type {Guid}
     */
    static IID := Guid("{abf28a9b-3393-4290-ba79-5ffc46d986b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSpatialAudioSample interfaces
    */
    struct Vtbl extends IMFSample.Vtbl {
        GetObjectCount               : IntPtr
        AddSpatialAudioObject        : IntPtr
        GetSpatialAudioObjectByIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSpatialAudioSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the count of spatial audio objects, represented by IMFSpatialAudioObjectBuffer objects, in the sample.
     * @returns {Integer} A pointer to a 32 bit variable where the total number of audio objects in the sample will be stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-getobjectcount
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
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-addspatialaudioobject
     */
    AddSpatialAudioObject(pAudioObjBuffer) {
        result := ComCall(48, this, "ptr", pAudioObjBuffer, "HRESULT")
        return result
    }

    /**
     * Returns the spatial audio object, represented by an IMFSpatialAudioObjectBuffer object, corresponding to the specified index.
     * @param {Integer} dwIndex A 32 bit variable with the 0-based index of the requested audio object.
     * @returns {IMFSpatialAudioObjectBuffer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfspatialaudio/nn-mfspatialaudio-imfspatialaudioobjectbuffer">IMFSpatialAudioObjectBuffer</a> object in which the spatial audio object corresponding with the specified index will be stored.
     * @see https://learn.microsoft.com/windows/win32/api/mfspatialaudio/nf-mfspatialaudio-imfspatialaudiosample-getspatialaudioobjectbyindex
     */
    GetSpatialAudioObjectByIndex(dwIndex) {
        result := ComCall(49, this, "uint", dwIndex, "ptr*", &ppAudioObjBuffer := 0, "HRESULT")
        return IMFSpatialAudioObjectBuffer(ppAudioObjBuffer)
    }

    Query(iid) {
        if (IMFSpatialAudioSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectCount := CallbackCreate(GetMethod(implObj, "GetObjectCount"), flags, 2)
        this.vtbl.AddSpatialAudioObject := CallbackCreate(GetMethod(implObj, "AddSpatialAudioObject"), flags, 2)
        this.vtbl.GetSpatialAudioObjectByIndex := CallbackCreate(GetMethod(implObj, "GetSpatialAudioObjectByIndex"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectCount)
        CallbackFree(this.vtbl.AddSpatialAudioObject)
        CallbackFree(this.vtbl.GetSpatialAudioObjectByIndex)
    }
}
