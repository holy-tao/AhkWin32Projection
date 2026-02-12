#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandAccount3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandAccount3
     * @type {Guid}
     */
    static IID => Guid("{092a1e21-9379-4b9b-ad31-d5fee2f748c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountExperienceUrl"]

    /**
     * @type {Uri} 
     */
    AccountExperienceUrl {
        get => this.get_AccountExperienceUrl()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AccountExperienceUrl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
