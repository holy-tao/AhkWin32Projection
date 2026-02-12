#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PosPrinterFontProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinter2
     * @type {Guid}
     */
    static IID => Guid("{248475e8-8b98-5517-8e48-760e86f68987}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedBarcodeSymbologies", "GetFontProperty"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedBarcodeSymbologies {
        get => this.get_SupportedBarcodeSymbologies()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBarcodeSymbologies() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @param {HSTRING} typeface 
     * @returns {PosPrinterFontProperty} 
     */
    GetFontProperty(typeface) {
        if(typeface is String) {
            pin := HSTRING.Create(typeface)
            typeface := pin.Value
        }
        typeface := typeface is Win32Handle ? NumGet(typeface, "ptr") : typeface

        result := ComCall(7, this, "ptr", typeface, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PosPrinterFontProperty(result_)
    }
}
