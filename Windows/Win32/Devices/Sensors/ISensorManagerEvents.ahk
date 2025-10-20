#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The callback interface for receiving sensor manager events.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensormanagerevents
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensorManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{9b3b0b86-266a-4aad-b21f-fde5501001b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSensorEnter"]

    /**
     * 
     * @param {ISensor} pSensor 
     * @param {Integer} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanagerevents-onsensorenter
     */
    OnSensorEnter(pSensor, state) {
        result := ComCall(3, this, "ptr", pSensor, "int", state, "HRESULT")
        return result
    }
}
