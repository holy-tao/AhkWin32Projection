#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IMediaRadioManagerNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaRadioManagerNotifySink
     * @type {Guid}
     */
    static IID => Guid("{89d81f5f-c147-49ed-a11c-77b20c31e7c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInstanceAdd", "OnInstanceRemove", "OnInstanceRadioChange"]

    /**
     * 
     * @param {IRadioInstance} pRadioInstance 
     * @returns {HRESULT} 
     */
    OnInstanceAdd(pRadioInstance) {
        result := ComCall(3, this, "ptr", pRadioInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRadioInstanceId 
     * @returns {HRESULT} 
     */
    OnInstanceRemove(bstrRadioInstanceId) {
        if(bstrRadioInstanceId is String) {
            pin := BSTR.Alloc(bstrRadioInstanceId)
            bstrRadioInstanceId := pin.Value
        }

        result := ComCall(4, this, "ptr", bstrRadioInstanceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRadioInstanceId 
     * @param {Integer} radioState 
     * @returns {HRESULT} 
     */
    OnInstanceRadioChange(bstrRadioInstanceId, radioState) {
        if(bstrRadioInstanceId is String) {
            pin := BSTR.Alloc(bstrRadioInstanceId)
            bstrRadioInstanceId := pin.Value
        }

        result := ComCall(5, this, "ptr", bstrRadioInstanceId, "int", radioState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
