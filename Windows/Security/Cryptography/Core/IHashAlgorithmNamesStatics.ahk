#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IHashAlgorithmNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHashAlgorithmNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{6b5e0516-de96-4f0a-8d57-dcc9dae36c76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Md5", "get_Sha1", "get_Sha256", "get_Sha384", "get_Sha512"]

    /**
     * @type {HSTRING} 
     */
    Md5 {
        get => this.get_Md5()
    }

    /**
     * @type {HSTRING} 
     */
    Sha1 {
        get => this.get_Sha1()
    }

    /**
     * @type {HSTRING} 
     */
    Sha256 {
        get => this.get_Sha256()
    }

    /**
     * @type {HSTRING} 
     */
    Sha384 {
        get => this.get_Sha384()
    }

    /**
     * @type {HSTRING} 
     */
    Sha512 {
        get => this.get_Sha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Md5() {
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
    get_Sha1() {
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
    get_Sha256() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Sha384() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Sha512() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
