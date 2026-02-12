#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IKeyStorageProviderNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyStorageProviderNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{af186ae0-5529-4602-bd94-0aab91957b5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SoftwareKeyStorageProvider", "get_SmartcardKeyStorageProvider", "get_PlatformKeyStorageProvider"]

    /**
     * @type {HSTRING} 
     */
    SoftwareKeyStorageProvider {
        get => this.get_SoftwareKeyStorageProvider()
    }

    /**
     * @type {HSTRING} 
     */
    SmartcardKeyStorageProvider {
        get => this.get_SmartcardKeyStorageProvider()
    }

    /**
     * @type {HSTRING} 
     */
    PlatformKeyStorageProvider {
        get => this.get_PlatformKeyStorageProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SoftwareKeyStorageProvider() {
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
    get_SmartcardKeyStorageProvider() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlatformKeyStorageProvider() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
