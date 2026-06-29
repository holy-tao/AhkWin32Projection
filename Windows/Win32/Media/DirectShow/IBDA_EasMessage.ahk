#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_EasMessage interface represents an ATSC emergency alert system (EAS) message table.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_EasMessage)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_easmessage
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_EasMessage extends IUnknown {
    /**
     * The interface identifier for IBDA_EasMessage
     * @type {Guid}
     */
    static IID := Guid("{d806973d-3ebe-46de-8fbb-6358fe784208}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_EasMessage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_EasMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_EasMessage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_EasMessage method retrieves an EAS message.
     * @remarks
     * This method retrieves a counted reference to an <b>IUnknown</b> interface instance. The caller is responsible for releasing the interface when it is no longer required.
     * @param {Integer} ulEventID Specifies the event ID of the EAS message.
     * @param {Pointer<IUnknown>} ppEASObject Pointer to a pointer variable that receives a pointer to the <b>IUnknown</b> interface of the EAS object. The caller can query this object for its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iscte_eas">ISCTE_EAS</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_easmessage-get_easmessage
     */
    get_EasMessage(ulEventID, ppEASObject) {
        result := ComCall(3, this, "uint", ulEventID, IUnknown.Ptr, ppEASObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_EasMessage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EasMessage := CallbackCreate(GetMethod(implObj, "get_EasMessage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EasMessage)
    }
}
