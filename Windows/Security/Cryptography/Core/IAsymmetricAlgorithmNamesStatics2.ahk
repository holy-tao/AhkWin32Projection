#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IAsymmetricAlgorithmNamesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsymmetricAlgorithmNamesStatics2
     * @type {Guid}
     */
    static IID => Guid("{f141c0d6-4bff-4f23-ba66-6045b137d5df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EcdsaSha256", "get_EcdsaSha384", "get_EcdsaSha512"]

    /**
     * @type {HSTRING} 
     */
    EcdsaSha256 {
        get => this.get_EcdsaSha256()
    }

    /**
     * @type {HSTRING} 
     */
    EcdsaSha384 {
        get => this.get_EcdsaSha384()
    }

    /**
     * @type {HSTRING} 
     */
    EcdsaSha512 {
        get => this.get_EcdsaSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EcdsaSha256() {
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
    get_EcdsaSha384() {
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
    get_EcdsaSha512() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
