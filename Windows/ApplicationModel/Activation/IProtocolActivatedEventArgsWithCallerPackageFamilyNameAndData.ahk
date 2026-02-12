#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data and the package family name of the app that activated the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolactivatedeventargswithcallerpackagefamilynameanddata
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData
     * @type {Guid}
     */
    static IID => Guid("{d84a0c12-5c8f-438c-83cb-c28fcc0b2fdb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CallerPackageFamilyName", "get_Data"]

    /**
     * Gets the package family name of the application that activated the current application.
     * @remarks
     * If the caller is an unpackaged app (such as an unpackaged desktop app), *CallerPackageFamilyName* will be empty, that is `""`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolactivatedeventargswithcallerpackagefamilynameanddata.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Data received from the application that activated the current application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolactivatedeventargswithcallerpackagefamilynameanddata.data
     * @type {ValueSet} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Data() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
