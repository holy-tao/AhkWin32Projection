#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDTFilterConfig interface configures the Decrypter/Detagger filter. Most applications will not have to use this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilterConfig)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-idtfilterconfig
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDTFilterConfig extends IUnknown {
    /**
     * The interface identifier for IDTFilterConfig
     * @type {Guid}
     */
    static IID := Guid("{c4c4c4d2-0049-4e2b-98fb-9537f6ce516d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDTFilterConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSecureChannelObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDTFilterConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSecureChannelObject method retrieves the secure channel object used to decrypt the stream.
     * @remarks
     * If the method succeeds, the caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the secure channel object's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilterconfig-getsecurechannelobject
     */
    GetSecureChannelObject() {
        result := ComCall(3, this, "ptr*", &ppUnkDRMSecureChannel := 0, "HRESULT")
        return IUnknown(ppUnkDRMSecureChannel)
    }

    Query(iid) {
        if (IDTFilterConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecureChannelObject := CallbackCreate(GetMethod(implObj, "GetSecureChannelObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecureChannelObject)
    }
}
