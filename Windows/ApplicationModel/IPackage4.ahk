#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage4
     * @type {Guid}
     */
    static IID => Guid("{65aed1ae-b95b-450c-882b-6255187f397e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SignatureKind", "get_IsOptional", "VerifyContentIntegrityAsync"]

    /**
     * @type {Integer} 
     */
    SignatureKind {
        get => this.get_SignatureKind()
    }

    /**
     * @type {Boolean} 
     */
    IsOptional {
        get => this.get_IsOptional()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignatureKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOptional() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    VerifyContentIntegrityAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
