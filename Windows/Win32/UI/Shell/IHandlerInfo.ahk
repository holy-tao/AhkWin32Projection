#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supplies methods that provide information about the handler to methods of the IHandlerActivationHost interface.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ihandlerinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHandlerInfo extends IUnknown{
    /**
     * The interface identifier for IHandlerInfo
     * @type {Guid}
     */
    static IID => Guid("{997706ef-f880-453b-8118-39e1a2d2655a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetApplicationDisplayName(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetApplicationPublisher(value) {
        result := ComCall(4, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetApplicationIconReference(value) {
        result := ComCall(5, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
