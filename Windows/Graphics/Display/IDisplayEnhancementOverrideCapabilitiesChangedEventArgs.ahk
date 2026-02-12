#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DisplayEnhancementOverrideCapabilities.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayEnhancementOverrideCapabilitiesChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayEnhancementOverrideCapabilitiesChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{db61e664-15fa-49da-8b77-07dbd2af585d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capabilities"]

    /**
     * @type {DisplayEnhancementOverrideCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * 
     * @returns {DisplayEnhancementOverrideCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayEnhancementOverrideCapabilities(value)
    }
}
