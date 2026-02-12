#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileProtectionInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileProtectionInfo2
     * @type {Guid}
     */
    static IID => Guid("{82123a4c-557a-498d-8e94-944cd5836432}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsProtectWhileOpenSupported"]

    /**
     * @type {Boolean} 
     */
    IsProtectWhileOpenSupported {
        get => this.get_IsProtectWhileOpenSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectWhileOpenSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
