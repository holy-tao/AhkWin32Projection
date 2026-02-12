#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallVideoCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallVideoCapabilities
     * @type {Guid}
     */
    static IID => Guid("{02382786-b16a-4fdb-be3b-c4240e13ad0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsVideoCallingCapable"]

    /**
     * @type {Boolean} 
     */
    IsVideoCallingCapable {
        get => this.get_IsVideoCallingCapable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoCallingCapable() {
        result := ComCall(6, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }
}
