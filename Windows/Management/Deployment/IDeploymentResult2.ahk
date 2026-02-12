#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IDeploymentResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeploymentResult2
     * @type {Guid}
     */
    static IID => Guid("{fc0e715c-5a01-4bd7-bcf1-381c8c82e04a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRegistered"]

    /**
     * @type {Boolean} 
     */
    IsRegistered {
        get => this.get_IsRegistered()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRegistered() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
