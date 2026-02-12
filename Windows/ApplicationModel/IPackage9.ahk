#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\Package.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackage9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackage9
     * @type {Guid}
     */
    static IID => Guid("{d5ab224f-d7e1-49ec-90ce-720cdbd02e9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindRelatedPackages", "get_SourceUriSchemeName"]

    /**
     * @type {HSTRING} 
     */
    SourceUriSchemeName {
        get => this.get_SourceUriSchemeName()
    }

    /**
     * Creates a new instance of [FindRelatedPackagesOptions](findrelatedpackagesoptions.md).
     * @param {FindRelatedPackagesOptions} options 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.findrelatedpackagesoptions.#ctor
     */
    FindRelatedPackages(options) {
        result := ComCall(6, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceUriSchemeName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
