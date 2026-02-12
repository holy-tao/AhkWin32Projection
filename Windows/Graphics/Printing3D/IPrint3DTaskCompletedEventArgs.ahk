#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrint3DTaskCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DTaskCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{cc1914af-2614-4f1d-accc-d6fc4fda5455}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Completion", "get_ExtendedStatus"]

    /**
     * @type {Integer} 
     */
    Completion {
        get => this.get_Completion()
    }

    /**
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Completion() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
