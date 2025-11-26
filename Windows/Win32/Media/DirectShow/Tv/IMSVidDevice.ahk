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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Power {
        get => this.get_Power()
        set => this.put_Power(value)
    }

    /**
     * @type {BSTR} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * @type {BSTR} 
     */
    ClassID {
        get => this.get_ClassID()
    }

    /**
     * @type {Guid} 
     */
    _Category {
        get => this.get__Category()
    }

    /**
     * @type {Guid} 
     */
    _ClassID {
        get => this.get__ClassID()
    }

    /**
     * The get_Name method retrieves the friendly name of the device.
     * @returns {BSTR} Pointer to a variable that receives the friendly name.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * The get_Status method retrieves status information about the device.
     * @returns {Integer} Pointer to a variable of that receives the current status.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get_status
     */
    get_Status() {
        result := ComCall(8, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * The put_Power method turns the device on or off.
     * @param {VARIANT_BOOL} Power 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-put_power
     */
    put_Power(Power) {
        result := ComCall(9, this, "short", Power, "HRESULT")
        return result
    }

    /**
     * The get_Power method queries whether the device is off or on.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get_power
     */
    get_Power() {
        result := ComCall(10, this, "short*", &Power := 0, "HRESULT")
        return Power
    }

    /**
     * The get_Category method retrieves the category of the device as a BSTR.
     * @returns {BSTR} <b>BSTR</b> that receives the device category.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get_category
     */
    get_Category() {
        Guid := BSTR()
        result := ComCall(11, this, "ptr", Guid, "HRESULT")
        return Guid
    }

    /**
     * The get_ClassID method retrieves the device's class identifier (CLSID) as a BSTR.
     * @returns {BSTR} Pointer to a variable that receives a string representation of the CLSID.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get_classid
     */
    get_ClassID() {
        Clsid := BSTR()
        result := ComCall(12, this, "ptr", Clsid, "HRESULT")
        return Clsid
    }

    /**
     * The get__Category method retrieves the category of the device as a GUID.
     * @returns {Guid} Pointer to a variable of type <b>GUID</b> that receives the device category.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get__category
     */
    get__Category() {
        Guid := Guid()
        result := ComCall(13, this, "ptr", Guid, "HRESULT")
        return Guid
    }

    /**
     * The get__ClassID method retrieves the device's class identifier (CLSID) as a GUID.
     * @returns {Guid} Pointer to a variable of type <b>GUID</b> that receives the CLSID.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-get__classid
     */
    get__ClassID() {
        Clsid := Guid()
        result := ComCall(14, this, "ptr", Clsid, "HRESULT")
        return Clsid
    }

    /**
     * The IsEqualDevice method queries whether this device and another device represent the same underlying hardware.
     * @param {IMSVidDevice} Device Pointer to the other device's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsviddevice">IMSVidDevice</a> interface.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsviddevice-isequaldevice
     */
    IsEqualDevice(Device) {
        result := ComCall(15, this, "ptr", Device, "short*", &IsEqual := 0, "HRESULT")
        return IsEqual
    }
}
