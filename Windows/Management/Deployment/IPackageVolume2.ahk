#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageVolume2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageVolume2
     * @type {Guid}
     */
    static IID => Guid("{46abcf2e-9dd4-47a2-ab8c-c6408349bcd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFullTrustPackageSupported", "get_IsAppxInstallSupported", "GetAvailableSpaceAsync"]

    /**
     * @type {Boolean} 
     */
    IsFullTrustPackageSupported {
        get => this.get_IsFullTrustPackageSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsAppxInstallSupported {
        get => this.get_IsAppxInstallSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullTrustPackageSupported() {
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
    get_IsAppxInstallSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetAvailableSpaceAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }
}
