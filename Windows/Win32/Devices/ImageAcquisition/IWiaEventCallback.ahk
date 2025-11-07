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
     * 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {BSTR} bstrEventDescription 
     * @param {BSTR} bstrDeviceID 
     * @param {BSTR} bstrDeviceDescription 
     * @param {Integer} dwDeviceType 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<Integer>} pulEventType 
     * @param {Integer} ulReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaeventcallback-imageeventcallback
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
