#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class ICallRejectEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallRejectEventArgs
     * @type {Guid}
     */
    static IID => Guid("{da47fad7-13d4-4d92-a1c2-b77811ee37ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RejectReason"]

    /**
     * @type {Integer} 
     */
    RejectReason {
        get => this.get_RejectReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RejectReason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
