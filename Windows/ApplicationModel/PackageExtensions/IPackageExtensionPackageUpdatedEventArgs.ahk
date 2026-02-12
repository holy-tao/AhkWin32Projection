#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Package.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PackageExtension.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class IPackageExtensionPackageUpdatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageExtensionPackageUpdatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fdc31add-16a7-509d-8bc4-fde22e856d2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageExtensionName", "get_Package", "get_Extensions"]

    /**
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {IVectorView<PackageExtension>} 
     */
    Extensions {
        get => this.get_Extensions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageExtensionName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }

    /**
     * 
     * @returns {IVectorView<PackageExtension>} 
     */
    get_Extensions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PackageExtension, value)
    }
}
