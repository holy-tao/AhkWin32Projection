#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresenceDevice extends IUnknown{
    /**
     * The interface identifier for IRTCPresenceDevice
     * @type {Guid}
     */
    static IID => Guid("{bc6a90dd-ad9a-48da-9b0c-2515e38521ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} penStatus 
     * @returns {HRESULT} 
     */
    get_Status(penStatus) {
        result := ComCall(3, this, "int*", penStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNotes 
     * @returns {HRESULT} 
     */
    get_Notes(pbstrNotes) {
        result := ComCall(4, this, "ptr", pbstrNotes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enProperty 
     * @param {Pointer<BSTR>} pbstrProperty 
     * @returns {HRESULT} 
     */
    get_PresenceProperty(enProperty, pbstrProperty) {
        result := ComCall(5, this, "int", enProperty, "ptr", pbstrProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(6, this, "ptr", pbstrNamespace, "ptr", pbstrData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
