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
     * 
     * @param {Pointer<UInt16>} pVType 
     * @returns {HRESULT} 
     */
    GetType(pVType) {
        result := ComCall(3, this, "ushort*", pVType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvValue 
     * @param {Pointer<UInt32>} pcbValue 
     * @returns {HRESULT} 
     */
    GetValue(pvValue, pcbValue) {
        result := ComCall(4, this, "ptr", pvValue, "uint*", pcbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvValue 
     * @param {Integer} cbValue 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetValue(pvValue, cbValue, pguidEventContext) {
        result := ComCall(5, this, "ptr", pvValue, "uint", cbValue, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMin 
     * @param {Pointer<Int32>} plMax 
     * @param {Pointer<Int32>} plStepping 
     * @returns {HRESULT} 
     */
    Get4BRange(plMin, plMax, plStepping) {
        result := ComCall(6, this, "int*", plMin, "int*", plMax, "int*", plStepping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
