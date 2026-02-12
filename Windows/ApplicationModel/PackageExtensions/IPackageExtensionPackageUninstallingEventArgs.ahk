#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Package.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class IPackageExtensionPackageUninstallingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageExtensionPackageUninstallingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3b8e9cb7-c539-554d-bb33-a84c0bfa3f50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageExtensionName", "get_Package"]

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
}
