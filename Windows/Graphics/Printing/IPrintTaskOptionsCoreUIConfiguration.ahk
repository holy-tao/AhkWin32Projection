#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface that provides access to the core UI configuration functionality that is supported by the print task options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreuiconfiguration
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptionsCoreUIConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptionsCoreUIConfiguration
     * @type {Guid}
     */
    static IID => Guid("{62e69e23-9a1e-4336-b74f-3cc7f4cff709}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayedOptions"]

    /**
     * Gets the **DisplayedOptions** option for a print task.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscoreuiconfiguration.displayedoptions
     * @type {IVector<HSTRING>} 
     */
    DisplayedOptions {
        get => this.get_DisplayedOptions()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DisplayedOptions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
