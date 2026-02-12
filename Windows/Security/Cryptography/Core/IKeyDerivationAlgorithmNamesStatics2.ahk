#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class IKeyDerivationAlgorithmNamesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyDerivationAlgorithmNamesStatics2
     * @type {Guid}
     */
    static IID => Guid("{57953fab-6044-466f-97f4-337b7808384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CapiKdfMd5", "get_CapiKdfSha1", "get_CapiKdfSha256", "get_CapiKdfSha384", "get_CapiKdfSha512"]

    /**
     * @type {HSTRING} 
     */
    CapiKdfMd5 {
        get => this.get_CapiKdfMd5()
    }

    /**
     * @type {HSTRING} 
     */
    CapiKdfSha1 {
        get => this.get_CapiKdfSha1()
    }

    /**
     * @type {HSTRING} 
     */
    CapiKdfSha256 {
        get => this.get_CapiKdfSha256()
    }

    /**
     * @type {HSTRING} 
     */
    CapiKdfSha384 {
        get => this.get_CapiKdfSha384()
    }

    /**
     * @type {HSTRING} 
     */
    CapiKdfSha512 {
        get => this.get_CapiKdfSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CapiKdfMd5() {
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
    get_CapiKdfSha1() {
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
    get_CapiKdfSha256() {
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
    get_CapiKdfSha384() {
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
    get_CapiKdfSha512() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
