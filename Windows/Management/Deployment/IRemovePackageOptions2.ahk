#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IRemovePackageOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemovePackageOptions2
     * @type {Guid}
     */
    static IID => Guid("{3fcc61e5-22c5-423b-b4b4-cf10bb50830c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeferRemovalWhenPackagesAreInUse", "put_DeferRemovalWhenPackagesAreInUse"]

    /**
     * @type {Boolean} 
     */
    DeferRemovalWhenPackagesAreInUse {
        get => this.get_DeferRemovalWhenPackagesAreInUse()
        set => this.put_DeferRemovalWhenPackagesAreInUse(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeferRemovalWhenPackagesAreInUse() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DeferRemovalWhenPackagesAreInUse(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
