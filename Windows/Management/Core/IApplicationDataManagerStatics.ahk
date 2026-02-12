#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\ApplicationData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Core
 * @version WindowsRuntime 1.4
 */
class IApplicationDataManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDataManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{1e1862e3-698e-49a1-9752-dee94925b9b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForPackageFamily"]

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {ApplicationData} 
     */
    CreateForPackageFamily(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(6, this, "ptr", packageFamilyName, "ptr*", &applicationData_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ApplicationData(applicationData_)
    }
}
