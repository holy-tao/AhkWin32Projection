#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMValidate extends IUnknown{
    /**
     * The interface identifier for IWMValidate
     * @type {Guid}
     */
    static IID => Guid("{cee3def2-3808-414d-be66-fafd472210bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidValidationID 
     * @returns {HRESULT} 
     */
    SetIdentifier(guidValidationID) {
        result := ComCall(3, this, "ptr", guidValidationID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
