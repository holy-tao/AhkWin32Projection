#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapServiceStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapServiceStatics3
     * @type {Guid}
     */
    static IID => Guid("{0a11ce20-63a7-4854-b355-d6dcda223d1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataAttributions"]

    /**
     * @type {HSTRING} 
     */
    DataAttributions {
        get => this.get_DataAttributions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataAttributions() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
