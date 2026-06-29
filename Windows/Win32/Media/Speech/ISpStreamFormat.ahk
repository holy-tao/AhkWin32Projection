#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpStreamFormat extends IStream {
    /**
     * The interface identifier for ISpStreamFormat
     * @type {Guid}
     */
    static IID := Guid("{bed530be-2606-4f4d-a1c0-54c5cda5566f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpStreamFormat interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        GetFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpStreamFormat.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidFormatId 
     * @returns {Pointer<WAVEFORMATEX>} 
     */
    GetFormat(pguidFormatId) {
        result := ComCall(14, this, Guid.Ptr, pguidFormatId, "ptr*", &ppCoMemWaveFormatEx := 0, "HRESULT")
        return ppCoMemWaveFormatEx
    }

    Query(iid) {
        if (ISpStreamFormat.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormat)
    }
}
