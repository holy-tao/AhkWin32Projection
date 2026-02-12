#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IKeyStorageProviderNamesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyStorageProviderNamesStatics2
     * @type {Guid}
     */
    static IID => Guid("{262d743d-9c2e-41cc-8812-c4d971dd7c60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PassportKeyStorageProvider"]

    /**
     * @type {HSTRING} 
     */
    PassportKeyStorageProvider {
        get => this.get_PassportKeyStorageProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PassportKeyStorageProvider() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
