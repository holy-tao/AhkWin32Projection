#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MicrosoftAccountMultiFactorAuthenticationManager.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class IMicrosoftAccountMultiFactorAuthenticatorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMicrosoftAccountMultiFactorAuthenticatorStatics
     * @type {Guid}
     */
    static IID => Guid("{d964c2e6-f446-4c71-8b79-6ea4024aa9b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {MicrosoftAccountMultiFactorAuthenticationManager} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {MicrosoftAccountMultiFactorAuthenticationManager} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MicrosoftAccountMultiFactorAuthenticationManager(value)
    }
}
