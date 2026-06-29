#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWiaEventCallback interface is used by applications to receive notification of Windows Image Acquisition (WIA) hardware device events.
 * @remarks
 * The <b>IWiaEventCallback</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwiaeventcallback
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaEventCallback extends IUnknown {
    /**
     * The interface identifier for IWiaEventCallback
     * @type {Guid}
     */
    static IID := Guid("{ae6287b0-0084-11d2-973b-00a0c9068f2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaEventCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ImageEventCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaEventCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWiaEventCallback::ImageEventCallback method is invoked by the Windows Image Acquisition (WIA) run-time system when a hardware device event occurs.
     * @remarks
     * To receive notification of WIA hardware device events, applications pass a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback">IWiaEventCallback</a> interface to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackinterface">RegisterEventCallbackInterface</a> method. The WIA run-time system then uses that interface pointer to invoke the <b>IWiaEventCallback::ImageEventCallback</b> method whenever a WIA hardware device event occurs.
     * 
     * Note that there is no guarantee the callback will be invoked on the same thread that registered the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback">IWiaEventCallback</a> interface.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Specifies the unique identifier of the event. For a complete list of device events, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-event-identifiers">WIA Event Identifiers</a>.
     * @param {BSTR} bstrEventDescription Type: <b>BSTR</b>
     * 
     * Specifies the string description of the event.
     * @param {BSTR} bstrDeviceID Type: <b>BSTR</b>
     * 
     * Specifies the unique identifier of the WIA device.
     * @param {BSTR} bstrDeviceDescription Type: <b>BSTR</b>
     * 
     * Specifies the string description of the device.
     * @param {Integer} dwDeviceType Type: <b>DWORD</b>
     * 
     * Specifies the type of the device. See <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-device-type-specifiers">WIA Device Type Specifiers</a> for a list of possible values.
     * @param {BSTR} bstrFullItemName Type: <b>BSTR</b>
     * 
     * Specifies the full name of the WIA item that represents the device.
     * @param {Pointer<Integer>} pulEventType Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> that specifies whether an event is a notification event, an action event, or both. A value of 1 indicates a notification event, a value of 2 indicates an action event, and a value of 3 indicates that the event is of both notification and action type.
     * @param {Integer} ulReserved Type: <b>ULONG</b>
     * 
     * Reserved for user information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaeventcallback-imageeventcallback
     */
    ImageEventCallback(pEventGUID, bstrEventDescription, bstrDeviceID, bstrDeviceDescription, dwDeviceType, bstrFullItemName, pulEventType, ulReserved) {
        bstrEventDescription := bstrEventDescription is String ? BSTR.Alloc(bstrEventDescription).Value : bstrEventDescription
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrDeviceDescription := bstrDeviceDescription is String ? BSTR.Alloc(bstrDeviceDescription).Value : bstrDeviceDescription
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        pulEventTypeMarshal := pulEventType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, pEventGUID, BSTR, bstrEventDescription, BSTR, bstrDeviceID, BSTR, bstrDeviceDescription, "uint", dwDeviceType, BSTR, bstrFullItemName, pulEventTypeMarshal, pulEventType, "uint", ulReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaEventCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ImageEventCallback := CallbackCreate(GetMethod(implObj, "ImageEventCallback"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ImageEventCallback)
    }
}
