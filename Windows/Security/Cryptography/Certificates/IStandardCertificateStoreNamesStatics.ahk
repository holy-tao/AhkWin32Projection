#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IStandardCertificateStoreNamesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardCertificateStoreNamesStatics
     * @type {Guid}
     */
    static IID => Guid("{0c154adb-a496-41f8-8fe5-9e96f36efbf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Personal", "get_TrustedRootCertificationAuthorities", "get_IntermediateCertificationAuthorities"]

    /**
     * @type {HSTRING} 
     */
    Personal {
        get => this.get_Personal()
    }

    /**
     * @type {HSTRING} 
     */
    TrustedRootCertificationAuthorities {
        get => this.get_TrustedRootCertificationAuthorities()
    }

    /**
     * @type {HSTRING} 
     */
    IntermediateCertificationAuthorities {
        get => this.get_IntermediateCertificationAuthorities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Personal() {
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
    get_TrustedRootCertificationAuthorities() {
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
    get_IntermediateCertificationAuthorities() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
