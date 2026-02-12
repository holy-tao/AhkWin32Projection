#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InputInjector.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInputInjectorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputInjectorStatics
     * @type {Guid}
     */
    static IID => Guid("{deae6943-7402-4141-a5c6-0c01aa57b16a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreate"]

    /**
     * Creates an install-time reference for a framework package dependency for the current app, using the specified package family name, minimum version, and additional criteria.
     * @remarks
     * In your app's installer or during the first run of your app, call this method to specify a set of criteria for a framework package you want to use in your app. This informs the OS that your app has a dependency upon a framework package that meets the specified criteria. If one or more framework packages are installed that meet the criteria, Windows will ensure that at least one of these framework packages will remain installed until the install-time reference is deleted. For more information, see [Use the dynamic dependency API to reference MSIX packages at run time](/windows/apps/desktop/modernize/framework-packages/use-the-dynamic-dependency-api).
     * 
     * This function fails if the specified dependency criteria cannot be resolved to a specific package. This package resolution check is skipped if [CreatePackageDependencyOptions_DoNotVerifyDependencyResolution](ne-appmodel-createpackagedependencyoptions.md) is specified for the *options* parameter. This is useful for installers running as user contexts other than the target user (for example, installers running as LocalSystem).
     * @returns {InputInjector} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-trycreatepackagedependency
     */
    TryCreate() {
        result := ComCall(6, this, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputInjector(instance)
    }
}
