#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Package.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppExtension.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class IAppExtensionPackageInstalledEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppExtensionPackageInstalledEventArgs
     * @type {Guid}
     */
    static IID => Guid("{39e59234-3351-4a8d-9745-e7d3dd45bc48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppExtensionName", "get_Package", "get_Extensions"]

    /**
     * @type {HSTRING} 
     */
    AppExtensionName {
        get => this.get_AppExtensionName()
    }

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {IVectorView<AppExtension>} 
     */
    Extensions {
        get => this.get_Extensions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppExtensionName() {
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
     * @returns {IVectorView<AppExtension>} 
     */
    get_Extensions() {
        result := ComCall(8, this, "ptr*", &values := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppExtension, values)
    }
}
