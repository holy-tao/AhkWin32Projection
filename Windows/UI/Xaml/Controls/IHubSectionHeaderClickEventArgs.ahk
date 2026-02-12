#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HubSection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHubSectionHeaderClickEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHubSectionHeaderClickEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e1c5ef04-1edd-4112-aeeb-996c96400698}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Section"]

    /**
     * @type {HubSection} 
     */
    Section {
        get => this.get_Section()
    }

    /**
     * 
     * @returns {HubSection} 
     */
    get_Section() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HubSection(value)
    }
}
