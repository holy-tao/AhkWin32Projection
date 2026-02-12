#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBoxTextChangingEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxTextChangingEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{c0723d44-53a6-415f-a981-50dfaf1becbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsContentChanging"]

    /**
     * @type {Boolean} 
     */
    IsContentChanging {
        get => this.get_IsContentChanging()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentChanging() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
