#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IDragDeltaEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragDeltaEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2c2dd73c-2806-49fc-aae9-6d792b572b6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalChange", "get_VerticalChange"]

    /**
     * @type {Float} 
     */
    HorizontalChange {
        get => this.get_HorizontalChange()
    }

    /**
     * @type {Float} 
     */
    VerticalChange {
        get => this.get_VerticalChange()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalChange() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalChange() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
