#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnCustomPromptOptionSelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnCustomPromptOptionSelector
     * @type {Guid}
     */
    static IID => Guid("{3b8f34d9-8ec1-4e95-9a4e-7ba64d38f330}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Options", "get_SelectedIndex"]

    /**
     * @type {IVector<HSTRING>} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Options() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
