#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{60edac78-78a6-4872-a3ef-98325ec8b843}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowPhoneCallUI"]

    /**
     * 
     * @param {HSTRING} phoneNumber 
     * @param {HSTRING} displayName 
     * @returns {HRESULT} 
     */
    ShowPhoneCallUI(phoneNumber, displayName) {
        if(phoneNumber is String) {
            pin := HSTRING.Create(phoneNumber)
            phoneNumber := pin.Value
        }
        phoneNumber := phoneNumber is Win32Handle ? NumGet(phoneNumber, "ptr") : phoneNumber
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(6, this, "ptr", phoneNumber, "ptr", displayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
