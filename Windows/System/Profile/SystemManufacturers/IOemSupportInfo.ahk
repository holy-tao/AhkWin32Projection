#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class IOemSupportInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOemSupportInfo
     * @type {Guid}
     */
    static IID => Guid("{8d2eae55-87ef-4266-86d0-c4afbeb29bb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportLink", "get_SupportAppLink", "get_SupportProvider"]

    /**
     * @type {Uri} 
     */
    SupportLink {
        get => this.get_SupportLink()
    }

    /**
     * @type {Uri} 
     */
    SupportAppLink {
        get => this.get_SupportAppLink()
    }

    /**
     * @type {HSTRING} 
     */
    SupportProvider {
        get => this.get_SupportProvider()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportLink() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportAppLink() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SupportProvider() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
