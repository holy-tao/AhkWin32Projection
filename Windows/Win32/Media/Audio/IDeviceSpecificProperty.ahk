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
     * The GetType method gets the data type of the device-specific property value.
     * @returns {Integer} Pointer to a <b>VARTYPE</b> variable into which the method writes a <b>VARTYPE</b> enumeration value that indicates the data type of the device-specific property value. For more information about <b>VARTYPE</b> and <b>VARTYPE</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicespecificproperty-gettype
     */
    GetType() {
        result := ComCall(3, this, "ushort*", &pVType := 0, "HRESULT")
        return pVType
    }

    /**
     * The GetValue method gets the current value of the device-specific property.
     * @param {Pointer<Integer>} pcbValue [inout] Pointer to a <b>DWORD</b> variable that specifies the size in bytes of the property value. On entry,  <i>*pcbValue</i> contains the size of the caller-allocated buffer (or 0 if <i>pvValue</i> is <b>NULL</b>). Before returning, the method writes the actual size of the property value written to the buffer (or the required size if the buffer is too small or if <i>pvValue</i> is <b>NULL</b>).
     * @returns {Void} Pointer to a caller-allocated buffer into which the method writes the property value.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicespecificproperty-getvalue
     */
    GetValue(pcbValue) {
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", &pvValue := 0, pcbValueMarshal, pcbValue, "HRESULT")
        return pvValue
    }

    /**
     * The SetValue method sets the value of the device-specific property.
     * @param {Pointer<Void>} pvValue Pointer to the new value for the device-specific property.
     * @param {Integer} cbValue The size in bytes of the device-specific property value.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetValue</b> call changes the state of the control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer <i>pvValue</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>cbValue</i> does not match the required size of the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicespecificproperty-setvalue
     */
    SetValue(pvValue, cbValue, pguidEventContext) {
        pvValueMarshal := pvValue is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvValueMarshal, pvValue, "uint", cbValue, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The Get4BRange method gets the 4-byte range of the device-specific property value.
     * @param {Pointer<Integer>} plMin Pointer to a <b>LONG</b> variable into which the method writes the minimum property value.
     * @param {Pointer<Integer>} plMax Pointer to a <b>LONG</b> variable into which the method writes the maximum property value.
     * @param {Pointer<Integer>} plStepping Pointer to a <b>LONG</b> variable into which the method writes the stepping value between consecutive property values in the range  <i>*plMin</i> to  <i>*plMax</i>. If the difference between the maximum and minimum property values is <i>d</i>, and the range is divided into <i>n</i> steps (uniformly sized intervals), then the property can take <i>n</i> + 1 discrete values and the size of the step between consecutive values is d / n.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer <i>plMin</i>, <i>plMax</i>, or <i>plStepping</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property value is not a 32-bit signed or unsigned integer. For information about this macro, see the Windows SDK documentation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicespecificproperty-get4brange
     */
    Get4BRange(plMin, plMax, plStepping) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"
        plSteppingMarshal := plStepping is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plMinMarshal, plMin, plMaxMarshal, plMax, plSteppingMarshal, plStepping, "HRESULT")
        return result
    }
}
