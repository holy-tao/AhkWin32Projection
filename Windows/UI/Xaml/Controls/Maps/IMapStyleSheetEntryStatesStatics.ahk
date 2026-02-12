#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapStyleSheetEntryStatesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapStyleSheetEntryStatesStatics
     * @type {Guid}
     */
    static IID => Guid("{23ac5532-866d-4bfa-b481-39bea1de3506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Disabled", "get_Hover", "get_Selected"]

    /**
     * @type {HSTRING} 
     */
    Disabled {
        get => this.get_Disabled()
    }

    /**
     * @type {HSTRING} 
     */
    Hover {
        get => this.get_Hover()
    }

    /**
     * @type {HSTRING} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Disabled() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Hover() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Selected() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
