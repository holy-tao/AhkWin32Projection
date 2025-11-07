#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_status
     */
    get_Status() {
        result := ComCall(8, this, "int*", &Status := 0, "HRESULT")
        return Status
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_power
     */
    get_Power() {
        result := ComCall(10, this, "short*", &Power := 0, "HRESULT")
        return Power
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_category
     */
    get_Category() {
        Guid := BSTR()
        result := ComCall(11, this, "ptr", Guid, "HRESULT")
        return Guid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_classid
     */
    get_ClassID() {
        Clsid := BSTR()
        result := ComCall(12, this, "ptr", Clsid, "HRESULT")
        return Clsid
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__category
     */
    get__Category() {
        Guid := Guid()
        result := ComCall(13, this, "ptr", Guid, "HRESULT")
        return Guid
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__classid
     */
    get__ClassID() {
        Clsid := Guid()
        result := ComCall(14, this, "ptr", Clsid, "HRESULT")
        return Clsid
    }

    /**
     * 
     * @param {IMSVidDevice} Device 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-isequaldevice
     */
    IsEqualDevice(Device) {
        result := ComCall(15, this, "ptr", Device, "short*", &IsEqual := 0, "HRESULT")
        return IsEqual
    }
}
