#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PackageExtensionCatalog.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class IPackageExtensionCatalogStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageExtensionCatalogStatics
     * @type {Guid}
     */
    static IID => Guid("{9588ece4-3183-5684-9e5f-27759733ddfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open"]

    /**
     * Open Method (ADO MD)
     * @remarks
     * The **Open** method generates an error if either of its parameters is omitted and its corresponding property value has not been set prior to attempting to open the **Cellset**.
     * @param {HSTRING} packageExtensionName 
     * @returns {PackageExtensionCatalog} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/open-method-ado-md
     */
    Open(packageExtensionName) {
        if(packageExtensionName is String) {
            pin := HSTRING.Create(packageExtensionName)
            packageExtensionName := pin.Value
        }
        packageExtensionName := packageExtensionName is Win32Handle ? NumGet(packageExtensionName, "ptr") : packageExtensionName

        result := ComCall(6, this, "ptr", packageExtensionName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PackageExtensionCatalog(result_)
    }
}
