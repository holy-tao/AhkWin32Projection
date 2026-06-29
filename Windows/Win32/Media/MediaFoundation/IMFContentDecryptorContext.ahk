#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows a decryptor to manage hardware keys and decrypt hardware samples.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcontentdecryptorcontext
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentDecryptorContext extends IUnknown {
    /**
     * The interface identifier for IMFContentDecryptorContext
     * @type {Guid}
     */
    static IID := Guid("{7ec4b1bd-43fb-4763-85d2-64fcb5c5f4cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentDecryptorContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeHardwareKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentDecryptorContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows the display driver to return IHV-specific information used when initializing a new hardware key.
     * @param {Integer} InputPrivateDataByteCount The number of bytes in the buffer that <i>InputPrivateData</i> specifies.
     * @param {Pointer<Void>} InputPrivateData The contents of this parameter are defined by the implementation of   
     *          the protection system that runs in the security processor. The contents may contain data about license or stream properties.
     * @returns {Integer} The return data is also defined by the implementation of the protection system implementation   
     *      that runs in the security processor.  The contents may contain data associated with the underlying hardware key.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentdecryptorcontext-initializehardwarekey
     */
    InitializeHardwareKey(InputPrivateDataByteCount, InputPrivateData) {
        InputPrivateDataMarshal := InputPrivateData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", InputPrivateDataByteCount, InputPrivateDataMarshal, InputPrivateData, "uint*", &OutputPrivateData := 0, "HRESULT")
        return OutputPrivateData
    }

    Query(iid) {
        if (IMFContentDecryptorContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeHardwareKey := CallbackCreate(GetMethod(implObj, "InitializeHardwareKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeHardwareKey)
    }
}
