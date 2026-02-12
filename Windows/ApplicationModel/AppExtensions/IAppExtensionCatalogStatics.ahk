#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppExtensionCatalog.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class IAppExtensionCatalogStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppExtensionCatalogStatics
     * @type {Guid}
     */
    static IID => Guid("{3c36668a-5f18-4f0b-9ce5-cab61d196f11}")

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
     * @param {HSTRING} appExtensionName 
     * @returns {AppExtensionCatalog} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/open-method-ado-md
     */
    Open(appExtensionName) {
        if(appExtensionName is String) {
            pin := HSTRING.Create(appExtensionName)
            appExtensionName := pin.Value
        }
        appExtensionName := appExtensionName is Win32Handle ? NumGet(appExtensionName, "ptr") : appExtensionName

        result := ComCall(6, this, "ptr", appExtensionName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppExtensionCatalog(value)
    }
}
