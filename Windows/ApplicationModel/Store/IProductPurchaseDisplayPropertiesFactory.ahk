#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProductPurchaseDisplayProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class IProductPurchaseDisplayPropertiesFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProductPurchaseDisplayPropertiesFactory
     * @type {Guid}
     */
    static IID => Guid("{6f491df4-32d6-4b40-b474-b83038a4d9cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProductPurchaseDisplayProperties"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {ProductPurchaseDisplayProperties} 
     */
    CreateProductPurchaseDisplayProperties(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &displayProperties_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProductPurchaseDisplayProperties(displayProperties_)
    }
}
