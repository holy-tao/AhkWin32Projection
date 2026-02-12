#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\ApplicationModel\AppInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportAppInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportAppInfo
     * @type {Guid}
     */
    static IID => Guid("{913cd9e0-cb44-5ae4-b984-f6e80e872320}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppInfo", "get_SupportedContracts"]

    /**
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

    /**
     * @type {Integer} 
     */
    SupportedContracts {
        get => this.get_SupportedContracts()
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedContracts() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
