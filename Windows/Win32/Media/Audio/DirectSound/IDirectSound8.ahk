#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectSound.ahk" { IDirectSound }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSound8 extends IDirectSound {
    /**
     * The interface identifier for IDirectSound8
     * @type {Guid}
     */
    static IID := Guid("{c50a7e93-f395-4834-9ef6-7fa99de50966}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSound8 interfaces
    */
    struct Vtbl extends IDirectSound.Vtbl {
        VerifyCertification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSound8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    VerifyCertification() {
        result := ComCall(11, this, "uint*", &pdwCertified := 0, "HRESULT")
        return pdwCertified
    }

    Query(iid) {
        if (IDirectSound8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.VerifyCertification := CallbackCreate(GetMethod(implObj, "VerifyCertification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.VerifyCertification)
    }
}
