#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramMaterialCharacteristics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramMaterialCharacteristics
     * @type {Guid}
     */
    static IID => Guid("{fc9ac5cc-c1d7-4153-923b-a2d43c6c8d49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaterialName", "get_AllowedAlgorithms", "get_AllowedProofOfPossessionAlgorithms", "get_AllowedValidations", "get_MaterialType", "get_ProtectionMethod", "get_ProtectionVersion", "get_MaterialLength"]

    /**
     * @type {HSTRING} 
     */
    MaterialName {
        get => this.get_MaterialName()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    AllowedAlgorithms {
        get => this.get_AllowedAlgorithms()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    AllowedProofOfPossessionAlgorithms {
        get => this.get_AllowedProofOfPossessionAlgorithms()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    AllowedValidations {
        get => this.get_AllowedValidations()
    }

    /**
     * @type {Integer} 
     */
    MaterialType {
        get => this.get_MaterialType()
    }

    /**
     * @type {Integer} 
     */
    ProtectionMethod {
        get => this.get_ProtectionMethod()
    }

    /**
     * @type {Integer} 
     */
    ProtectionVersion {
        get => this.get_ProtectionVersion()
    }

    /**
     * @type {Integer} 
     */
    MaterialLength {
        get => this.get_MaterialLength()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MaterialName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedAlgorithms() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedProofOfPossessionAlgorithms() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedValidations() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialType() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionMethod() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionVersion() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialLength() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
