#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Input\KeyboardAndMouse\HKL.ahk" { HKL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is implemented by the TSF manager and is used by an application or text service to manipulate the substitute input locale identifier (keyboard layout) of a text service profile.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfinputprocessorprofilesubstitutelayout
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInputProcessorProfileSubstituteLayout extends IUnknown {
    /**
     * The interface identifier for ITfInputProcessorProfileSubstituteLayout
     * @type {Guid}
     */
    static IID := Guid("{4fd67194-1002-4513-bff2-c0ddf6258552}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInputProcessorProfileSubstituteLayout interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSubstituteKeyboardLayout : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInputProcessorProfileSubstituteLayout.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfInputProcessorProfileSubstituteLayout::GetSubstituteKeyboardLayout method
     * @param {Pointer<Guid>} rclsid Contains the class identifier of the text service.
     * @param {Integer} langid Specifies the language of the profile. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>.
     * @param {Pointer<Guid>} guidProfile Identifies the profile GUID.
     * @returns {HKL} Pointer to an <b>HKL</b> value that specifies the substitute input locale identifier.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilesubstitutelayout-getsubstitutekeyboardlayout
     */
    GetSubstituteKeyboardLayout(rclsid, langid, guidProfile) {
        phKL := HKL.Owned()
        result := ComCall(3, this, Guid.Ptr, rclsid, "ushort", langid, Guid.Ptr, guidProfile, HKL.Ptr, phKL, "HRESULT")
        return phKL
    }

    Query(iid) {
        if (ITfInputProcessorProfileSubstituteLayout.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSubstituteKeyboardLayout := CallbackCreate(GetMethod(implObj, "GetSubstituteKeyboardLayout"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSubstituteKeyboardLayout)
    }
}
