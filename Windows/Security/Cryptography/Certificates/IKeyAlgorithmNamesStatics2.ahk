#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IKeyAlgorithmNamesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyAlgorithmNamesStatics2
     * @type {Guid}
     */
    static IID => Guid("{c99b5686-e1fd-4a4a-893d-a26f33dd8bb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ecdsa", "get_Ecdh"]

    /**
     * @type {HSTRING} 
     */
    Ecdsa {
        get => this.get_Ecdsa()
    }

    /**
     * @type {HSTRING} 
     */
    Ecdh {
        get => this.get_Ecdh()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ecdsa() {
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
    get_Ecdh() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
