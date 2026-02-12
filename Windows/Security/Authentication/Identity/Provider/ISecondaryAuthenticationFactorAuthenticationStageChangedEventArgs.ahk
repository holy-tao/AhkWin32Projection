#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\SecondaryAuthenticationFactorAuthenticationStageInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d4a5ee56-7291-4073-bc1f-ccb8f5afdf96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StageInfo"]

    /**
     * @type {SecondaryAuthenticationFactorAuthenticationStageInfo} 
     */
    StageInfo {
        get => this.get_StageInfo()
    }

    /**
     * 
     * @returns {SecondaryAuthenticationFactorAuthenticationStageInfo} 
     */
    get_StageInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryAuthenticationFactorAuthenticationStageInfo(value)
    }
}
