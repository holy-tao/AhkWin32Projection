#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidDevice interface is the base interface for all the devices and features that the Video Control supports.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDevice)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsviddevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidDevice extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidDevice
     * @type {Guid}
     */
    static IID => Guid("{1c15d47c-911d-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for MSVidDevice
     * @type {Guid}
     */
    static CLSID => Guid("{6e40476f-9c49-4c3e-8bb9-8587958eff74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Status", "put_Power", "get_Power", "get_Category", "get_ClassID", "get__Category", "get__ClassID", "IsEqualDevice"]

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_name
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_status
     */
    get_Status(Status) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, StatusMarshal, Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Power 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-put_power
     */
    put_Power(Power) {
        result := ComCall(9, this, "short", Power, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Power 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_power
     */
    get_Power(Power) {
        result := ComCall(10, this, "ptr", Power, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_category
     */
    get_Category(Guid) {
        result := ComCall(11, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_classid
     */
    get_ClassID(Clsid) {
        result := ComCall(12, this, "ptr", Clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__category
     */
    get__Category(Guid) {
        result := ComCall(13, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__classid
     */
    get__ClassID(Clsid) {
        result := ComCall(14, this, "ptr", Clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidDevice} Device 
     * @param {Pointer<VARIANT_BOOL>} IsEqual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-isequaldevice
     */
    IsEqualDevice(Device, IsEqual) {
        result := ComCall(15, this, "ptr", Device, "ptr", IsEqual, "HRESULT")
        return result
    }
}
