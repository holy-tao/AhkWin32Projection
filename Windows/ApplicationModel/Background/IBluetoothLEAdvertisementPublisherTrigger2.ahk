#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementPublisherTrigger2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementPublisherTrigger2
     * @type {Guid}
     */
    static IID => Guid("{aa28d064-38f4-597d-b597-4e55588c6503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreferredTransmitPowerLevelInDBm", "put_PreferredTransmitPowerLevelInDBm", "get_UseExtendedFormat", "put_UseExtendedFormat", "get_IsAnonymous", "put_IsAnonymous", "get_IncludeTransmitPowerLevel", "put_IncludeTransmitPowerLevel"]

    /**
     * @type {IReference<Integer>} 
     */
    PreferredTransmitPowerLevelInDBm {
        get => this.get_PreferredTransmitPowerLevelInDBm()
        set => this.put_PreferredTransmitPowerLevelInDBm(value)
    }

    /**
     * @type {Boolean} 
     */
    UseExtendedFormat {
        get => this.get_UseExtendedFormat()
        set => this.put_UseExtendedFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAnonymous {
        get => this.get_IsAnonymous()
        set => this.put_IsAnonymous(value)
    }

    /**
     * @type {Boolean} 
     */
    IncludeTransmitPowerLevel {
        get => this.get_IncludeTransmitPowerLevel()
        set => this.put_IncludeTransmitPowerLevel(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PreferredTransmitPowerLevelInDBm() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt16(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PreferredTransmitPowerLevelInDBm(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseExtendedFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseExtendedFormat(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnonymous() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAnonymous(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeTransmitPowerLevel() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeTransmitPowerLevel(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
