#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CustomXamlResourceLoader.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Resources
 * @version WindowsRuntime 1.4
 */
class ICustomXamlResourceLoaderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomXamlResourceLoaderStatics
     * @type {Guid}
     */
    static IID => Guid("{224ff617-e4dc-4c27-ad32-db93d5d0e5da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "put_Current"]

    /**
     * @type {CustomXamlResourceLoader} 
     */
    Current {
        get => this.get_Current()
        set => this.put_Current(value)
    }

    /**
     * 
     * @returns {CustomXamlResourceLoader} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CustomXamlResourceLoader(value)
    }

    /**
     * 
     * @param {CustomXamlResourceLoader} value 
     * @returns {HRESULT} 
     */
    put_Current(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
