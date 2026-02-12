#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAppletIdGroupRegistration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAppletIdGroupRegistration2
     * @type {Guid}
     */
    static IID => Guid("{5f5508d8-98a7-4f2e-91d9-6cfcceda407f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmartCardReaderId", "SetPropertiesAsync"]

    /**
     * @type {HSTRING} 
     */
    SmartCardReaderId {
        get => this.get_SmartCardReaderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmartCardReaderId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ValueSet} props 
     * @returns {IAsyncAction} 
     */
    SetPropertiesAsync(props) {
        result := ComCall(7, this, "ptr", props, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
