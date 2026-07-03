#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides information about the capabilities of a BDA device filter that represents a TV tuner. This interface extends the ITunerCap interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITunerCapEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-itunercapex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITunerCapEx extends IUnknown {
    /**
     * The interface identifier for ITunerCapEx
     * @type {Guid}
     */
    static IID := Guid("{ed3e0c66-18c8-4ea6-9300-f6841fdd35dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITunerCapEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Has608_708Caption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITunerCapEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Has608_708Caption {
        get => this.get_Has608_708Caption()
    }

    /**
     * Gets a flag indicating whether a BDA tuner device supports 608/708 closed captioning for ATSC, digital cable, or analog cable. In 608/708 closed captioning, the broadcast includes closed-captioning data.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunercapex-get_has608_708caption
     */
    get_Has608_708Caption() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &pbHasCaption := 0, "HRESULT")
        return pbHasCaption
    }

    Query(iid) {
        if (ITunerCapEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Has608_708Caption := CallbackCreate(GetMethod(implObj, "get_Has608_708Caption"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Has608_708Caption)
    }
}
