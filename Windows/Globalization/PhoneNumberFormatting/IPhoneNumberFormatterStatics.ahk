#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPhoneNumberFormatterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNumberFormatterStatics
     * @type {Guid}
     */
    static IID => Guid("{5ca6f931-84d9-414b-ab4e-a0552c878602}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreate", "GetCountryCodeForRegion", "GetNationalDirectDialingPrefixForRegion", "WrapWithLeftToRightMarkers"]

    /**
     * Creates an install-time reference for a framework package dependency for the current app, using the specified package family name, minimum version, and additional criteria.
     * @remarks
     * In your app's installer or during the first run of your app, call this method to specify a set of criteria for a framework package you want to use in your app. This informs the OS that your app has a dependency upon a framework package that meets the specified criteria. If one or more framework packages are installed that meet the criteria, Windows will ensure that at least one of these framework packages will remain installed until the install-time reference is deleted. For more information, see [Use the dynamic dependency API to reference MSIX packages at run time](/windows/apps/desktop/modernize/framework-packages/use-the-dynamic-dependency-api).
     * 
     * This function fails if the specified dependency criteria cannot be resolved to a specific package. This package resolution check is skipped if [CreatePackageDependencyOptions_DoNotVerifyDependencyResolution](ne-appmodel-createpackagedependencyoptions.md) is specified for the *options* parameter. This is useful for installers running as user contexts other than the target user (for example, installers running as LocalSystem).
     * @param {HSTRING} regionCode 
     * @param {Pointer<PhoneNumberFormatter>} phoneNumber 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
     * 
     * | Return code | Description |
     * |-------------|-------------|
     * | E_INVALIDARG | The *packageDependencyId* parameter is NULL on input. |
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-trycreatepackagedependency
     */
    TryCreate(regionCode, phoneNumber) {
        if(regionCode is String) {
            pin := HSTRING.Create(regionCode)
            regionCode := pin.Value
        }
        regionCode := regionCode is Win32Handle ? NumGet(regionCode, "ptr") : regionCode

        result := ComCall(6, this, "ptr", regionCode, "ptr", phoneNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} regionCode 
     * @returns {Integer} 
     */
    GetCountryCodeForRegion(regionCode) {
        if(regionCode is String) {
            pin := HSTRING.Create(regionCode)
            regionCode := pin.Value
        }
        regionCode := regionCode is Win32Handle ? NumGet(regionCode, "ptr") : regionCode

        result := ComCall(7, this, "ptr", regionCode, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} regionCode 
     * @param {Boolean} stripNonDigit 
     * @returns {HSTRING} 
     */
    GetNationalDirectDialingPrefixForRegion(regionCode, stripNonDigit) {
        if(regionCode is String) {
            pin := HSTRING.Create(regionCode)
            regionCode := pin.Value
        }
        regionCode := regionCode is Win32Handle ? NumGet(regionCode, "ptr") : regionCode

        result_ := HSTRING()
        result := ComCall(8, this, "ptr", regionCode, "int", stripNonDigit, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {HSTRING} 
     */
    WrapWithLeftToRightMarkers(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result_ := HSTRING()
        result := ComCall(9, this, "ptr", number_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
