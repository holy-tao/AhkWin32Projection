#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaEventCallback interface is used by applications to receive notification of Windows Image Acquisition (WIA) hardware device events.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiaeventcallback
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaEventCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaEventCallback
     * @type {Guid}
     */
    static IID => Guid("{ae6287b0-0084-11d2-973b-00a0c9068f2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ImageEventCallback"]

    /**
     * The IWiaEventCallback::ImageEventCallback method is invoked by the Windows Image Acquisition (WIA) run-time system when a hardware device event occurs.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiaeventcallback-imageeventcallback
     */
    ImageEventCallback(pEventGUID, bstrEventDescription, bstrDeviceID, bstrDeviceDescription, dwDeviceType, bstrFullItemName, pulEventType, ulReserved) {
        bstrEventDescription := bstrEventDescription is String ? BSTR.Alloc(bstrEventDescription).Value : bstrEventDescription
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrDeviceDescription := bstrDeviceDescription is String ? BSTR.Alloc(bstrDeviceDescription).Value : bstrDeviceDescription
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        pulEventTypeMarshal := pulEventType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pEventGUID, "ptr", bstrEventDescription, "ptr", bstrDeviceID, "ptr", bstrDeviceDescription, "uint", dwDeviceType, "ptr", bstrFullItemName, pulEventTypeMarshal, pulEventType, "uint", ulReserved, "HRESULT")
        return result
    }
}
