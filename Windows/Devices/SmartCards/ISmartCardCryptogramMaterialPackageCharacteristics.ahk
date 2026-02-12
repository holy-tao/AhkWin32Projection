#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramMaterialPackageCharacteristics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramMaterialPackageCharacteristics
     * @type {Guid}
     */
    static IID => Guid("{ffb58e1f-0692-4c47-93cf-34d91f9dcd00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageName", "get_StorageKeyName", "get_DateImported", "get_PackageFormat"]

    /**
     * @type {HSTRING} 
     */
    PackageName {
        get => this.get_PackageName()
    }

    /**
     * @type {HSTRING} 
     */
    StorageKeyName {
        get => this.get_StorageKeyName()
    }

    /**
     * @type {DateTime} 
     */
    DateImported {
        get => this.get_DateImported()
    }

    /**
     * @type {Integer} 
     */
    PackageFormat {
        get => this.get_PackageFormat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StorageKeyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateImported() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageFormat() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
