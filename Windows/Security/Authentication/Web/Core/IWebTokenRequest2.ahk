#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebTokenRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenRequest2
     * @type {Guid}
     */
    static IID => Guid("{d700c079-30c8-4397-9654-961c3be8b855}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppProperties"]

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    AppProperties {
        get => this.get_AppProperties()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_AppProperties() {
        result := ComCall(6, this, "ptr*", &requestProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), requestProperties)
    }
}
