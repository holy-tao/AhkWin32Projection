#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class IForegroundEnergyManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IForegroundEnergyManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{9ff86872-e677-4814-9a20-5337ca732b98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LowUsageLevel", "get_NearMaxAcceptableUsageLevel", "get_MaxAcceptableUsageLevel", "get_ExcessiveUsageLevel", "get_RecentEnergyUsage", "get_RecentEnergyUsageLevel", "add_RecentEnergyUsageIncreased", "remove_RecentEnergyUsageIncreased", "add_RecentEnergyUsageReturnedToLow", "remove_RecentEnergyUsageReturnedToLow"]

    /**
     * @type {Integer} 
     */
    LowUsageLevel {
        get => this.get_LowUsageLevel()
    }

    /**
     * @type {Integer} 
     */
    NearMaxAcceptableUsageLevel {
        get => this.get_NearMaxAcceptableUsageLevel()
    }

    /**
     * @type {Integer} 
     */
    MaxAcceptableUsageLevel {
        get => this.get_MaxAcceptableUsageLevel()
    }

    /**
     * @type {Integer} 
     */
    ExcessiveUsageLevel {
        get => this.get_ExcessiveUsageLevel()
    }

    /**
     * @type {Integer} 
     */
    RecentEnergyUsage {
        get => this.get_RecentEnergyUsage()
    }

    /**
     * @type {Integer} 
     */
    RecentEnergyUsageLevel {
        get => this.get_RecentEnergyUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowUsageLevel() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NearMaxAcceptableUsageLevel() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAcceptableUsageLevel() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExcessiveUsageLevel() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecentEnergyUsage() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecentEnergyUsageLevel() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RecentEnergyUsageIncreased(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RecentEnergyUsageIncreased(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RecentEnergyUsageReturnedToLow(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RecentEnergyUsageReturnedToLow(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
