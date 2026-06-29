#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes a method that enables a client application to create a helper object in the server context.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-icocreatelocally
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ICoCreateLocally extends IUnknown {
    /**
     * The interface identifier for ICoCreateLocally
     * @type {Guid}
     */
    static IID := Guid("{03de00aa-f272-41e3-99cb-03c5e8114ea0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoCreateLocally interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CoCreateLocally : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoCreateLocally.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Clients call ICoCreateLocally::CoCreateLocally to create a helper object in the same context as the server object.
     * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
     * 
     * Class identifier of the object to be created locally.
     * @param {Integer} dwClsContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Context in which the helper object should run. This is usually CLSCTX_INPROC_SERVER.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired interface identifier (IID).
     * @param {Pointer<Guid>} riidParam Type: <b>REFIID</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies an interface identifier.
     * @param {IUnknown} punkParam Type: <b>IUnknown*</b>
     * 
     * An optional interface parameter that is passed to the new helper object. This parameter specifies the interface pointer.
     * @param {VARIANT} varParam Type: <b>VARIANT</b>
     * 
     * An optional interface parameter that is passed to the new helper object.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the desired interface identifier (from <i>riid</i>).
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-icocreatelocally-cocreatelocally
     */
    CoCreateLocally(rclsid, dwClsContext, riid, riidParam, punkParam, varParam) {
        result := ComCall(3, this, Guid.Ptr, rclsid, "uint", dwClsContext, Guid.Ptr, riid, "ptr*", &punk := 0, Guid.Ptr, riidParam, "ptr", punkParam, VARIANT, varParam, "HRESULT")
        return IUnknown(punk)
    }

    Query(iid) {
        if (ICoCreateLocally.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CoCreateLocally := CallbackCreate(GetMethod(implObj, "CoCreateLocally"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CoCreateLocally)
    }
}
