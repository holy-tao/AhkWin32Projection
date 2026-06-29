#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a list of supported audio formats. The most preferred format is first in the list. Get a reference to this interface by calling ISpatialAudioClient::GetSupportedAudioObjectFormatEnumerator.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-iaudioformatenumerator
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioFormatEnumerator extends IUnknown {
    /**
     * The interface identifier for IAudioFormatEnumerator
     * @type {Guid}
     */
    static IID := Guid("{dcdaa858-895a-4a22-a5eb-67bda506096d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioFormatEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount  : IntPtr
        GetFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioFormatEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of supported audio formats in the list.
     * @returns {Integer} The number of supported audio formats in the list.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets the format with the specified index in the list. The formats are listed in order of importance. The most preferable format is first in the list.
     * @param {Integer} index The index of the item in the list to retrieve.
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer to a <b>WAVEFORMATEX</b> structure describing a supported audio format.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getformat
     */
    GetFormat(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &format := 0, "HRESULT")
        return format
    }

    Query(iid) {
        if (IAudioFormatEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetFormat)
    }
}
