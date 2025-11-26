#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITPhone.ahk
#Include .\ITTAPIObjectEvent.ahk

/**
 * The ITTAPIObjectEvent2 interface is an extension of the ITTAPIObjectEvent interface. ITTAPIObjectEvent2 exposes an additional method that returns a pointer to an ITPhone interface on the phone object that caused the TAPI object event.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapiobjectevent2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPIObjectEvent2 extends ITTAPIObjectEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPIObjectEvent2
     * @type {Guid}
     */
    static IID => Guid("{359dda6e-68ce-4383-bf0b-169133c41b46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Phone"]

    /**
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * The get_Phone method returns a pointer to the ITPhone interface on the phone object that caused this TAPI object event to be fired.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-ittapiobjectevent2-get_phone
     */
    get_Phone() {
        result := ComCall(11, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }
}
