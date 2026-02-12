#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageAllUserProvisioningOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageAllUserProvisioningOptions
     * @type {Guid}
     */
    static IID => Guid("{da35aa22-1de0-5d3e-99ff-d24f3118bf5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OptionalPackageFamilyNames", "get_ProjectionOrderPackageFamilyNames"]

    /**
     * @type {IVector<HSTRING>} 
     */
    OptionalPackageFamilyNames {
        get => this.get_OptionalPackageFamilyNames()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ProjectionOrderPackageFamilyNames {
        get => this.get_ProjectionOrderPackageFamilyNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_OptionalPackageFamilyNames() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ProjectionOrderPackageFamilyNames() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
