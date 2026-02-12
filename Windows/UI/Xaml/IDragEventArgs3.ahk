#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDragEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{d04fc3c6-8119-427a-8152-5f9550cc0416}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowedOperations"]

    /**
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
