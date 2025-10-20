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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(8, this, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Power 
     * @returns {HRESULT} 
     */
    put_Power(Power) {
        result := ComCall(9, this, "short", Power, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Power 
     * @returns {HRESULT} 
     */
    get_Power(Power) {
        result := ComCall(10, this, "ptr", Power, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Guid 
     * @returns {HRESULT} 
     */
    get_Category(Guid) {
        result := ComCall(11, this, "ptr", Guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Clsid 
     * @returns {HRESULT} 
     */
    get_ClassID(Clsid) {
        result := ComCall(12, this, "ptr", Clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @returns {HRESULT} 
     */
    get__Category(Guid) {
        result := ComCall(13, this, "ptr", Guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Clsid 
     * @returns {HRESULT} 
     */
    get__ClassID(Clsid) {
        result := ComCall(14, this, "ptr", Clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidDevice>} Device 
     * @param {Pointer<VARIANT_BOOL>} IsEqual 
     * @returns {HRESULT} 
     */
    IsEqualDevice(Device, IsEqual) {
        result := ComCall(15, this, "ptr", Device, "ptr", IsEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
