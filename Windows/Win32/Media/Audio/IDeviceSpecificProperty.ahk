#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDeviceSpecificProperty interface provides access to the control value of a device-specific hardware control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-idevicespecificproperty
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IDeviceSpecificProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceSpecificProperty
     * @type {Guid}
     */
    static IID => Guid("{3b22bcbf-2586-4af0-8583-205d391b807c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetValue", "SetValue", "Get4BRange"]

    /**
     * 
     * @param {Pointer<Integer>} pVType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicespecificproperty-gettype
     */
    GetType(pVType) {
        result := ComCall(3, this, "ushort*", pVType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvValue 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicespecificproperty-getvalue
     */
    GetValue(pvValue, pcbValue) {
        result := ComCall(4, this, "ptr", pvValue, "uint*", pcbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvValue 
     * @param {Integer} cbValue 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicespecificproperty-setvalue
     */
    SetValue(pvValue, cbValue, pguidEventContext) {
        result := ComCall(5, this, "ptr", pvValue, "uint", cbValue, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMin 
     * @param {Pointer<Integer>} plMax 
     * @param {Pointer<Integer>} plStepping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicespecificproperty-get4brange
     */
    Get4BRange(plMin, plMax, plStepping) {
        result := ComCall(6, this, "int*", plMin, "int*", plMax, "int*", plStepping, "HRESULT")
        return result
    }
}
