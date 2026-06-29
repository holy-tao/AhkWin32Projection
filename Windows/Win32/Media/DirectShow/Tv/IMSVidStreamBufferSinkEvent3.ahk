#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidStreamBufferSinkEvent2.ahk" { IMSVidStreamBufferSinkEvent2 }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent3)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersinkevent3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSinkEvent3 extends IMSVidStreamBufferSinkEvent2 {
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent3
     * @type {Guid}
     */
    static IID := Guid("{735ad8d5-c259-48e9-81e7-d27953665b23}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSinkEvent3 interfaces
    */
    struct Vtbl extends IMSVidStreamBufferSinkEvent2.Vtbl {
        LicenseChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSinkEvent3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Integer} dwProt Specifies the new license as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/encdec/ne-encdec-prottype">ProtType</a> enumeration.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent3-licensechange
     */
    LicenseChange(dwProt) {
        result := ComCall(13, this, "int", dwProt, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSinkEvent3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LicenseChange := CallbackCreate(GetMethod(implObj, "LicenseChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LicenseChange)
    }
}
