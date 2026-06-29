#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAudioMediaType.ahk" { IAudioMediaType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioProcessingObjectPreferredFormatSupport extends IUnknown {
    /**
     * The interface identifier for IAudioProcessingObjectPreferredFormatSupport
     * @type {Guid}
     */
    static IID := Guid("{51cbd3c4-f1f3-4d2f-a0e1-7e9c4dd0feb3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioProcessingObjectPreferredFormatSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPreferredInputFormat  : IntPtr
        GetPreferredOutputFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioProcessingObjectPreferredFormatSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IAudioMediaType} outputFormat 
     * @returns {IAudioMediaType} 
     */
    GetPreferredInputFormat(outputFormat) {
        result := ComCall(3, this, "ptr", outputFormat, "ptr*", &_preferredFormat := 0, "HRESULT")
        return IAudioMediaType(_preferredFormat)
    }

    /**
     * 
     * @param {IAudioMediaType} inputFormat 
     * @returns {IAudioMediaType} 
     */
    GetPreferredOutputFormat(inputFormat) {
        result := ComCall(4, this, "ptr", inputFormat, "ptr*", &_preferredFormat := 0, "HRESULT")
        return IAudioMediaType(_preferredFormat)
    }

    Query(iid) {
        if (IAudioProcessingObjectPreferredFormatSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreferredInputFormat := CallbackCreate(GetMethod(implObj, "GetPreferredInputFormat"), flags, 3)
        this.vtbl.GetPreferredOutputFormat := CallbackCreate(GetMethod(implObj, "GetPreferredOutputFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreferredInputFormat)
        CallbackFree(this.vtbl.GetPreferredOutputFormat)
    }
}
