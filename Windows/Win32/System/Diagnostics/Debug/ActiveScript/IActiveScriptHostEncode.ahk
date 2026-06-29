#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptHostEncode extends IUnknown {
    /**
     * The interface identifier for IActiveScriptHostEncode
     * @type {Guid}
     */
    static IID := Guid("{bee9b76e-cfe3-11d1-b747-00c04fc2b085}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptHostEncode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EncodeScriptHostFile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptHostEncode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrInFile 
     * @param {Pointer<BSTR>} pbstrOutFile 
     * @param {Integer} cFlags 
     * @param {BSTR} bstrDefaultLang 
     * @returns {HRESULT} 
     */
    EncodeScriptHostFile(bstrInFile, pbstrOutFile, cFlags, bstrDefaultLang) {
        bstrInFile := bstrInFile is String ? BSTR.Alloc(bstrInFile).Value : bstrInFile
        bstrDefaultLang := bstrDefaultLang is String ? BSTR.Alloc(bstrDefaultLang).Value : bstrDefaultLang

        result := ComCall(3, this, BSTR, bstrInFile, BSTR.Ptr, pbstrOutFile, "uint", cFlags, BSTR, bstrDefaultLang, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptHostEncode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncodeScriptHostFile := CallbackCreate(GetMethod(implObj, "EncodeScriptHostFile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncodeScriptHostFile)
    }
}
