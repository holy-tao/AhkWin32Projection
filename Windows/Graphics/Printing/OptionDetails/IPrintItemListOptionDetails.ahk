#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents objects that list print task option items.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintitemlistoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintItemListOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintItemListOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{9a2257bf-fe61-43d8-a24f-a3f6ab7320e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items"]

    /**
     * Gets a list of the print task option items.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintitemlistoptiondetails.items
     * @type {IVectorView<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {IVectorView<IInspectable>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IInspectable, value)
    }
}
