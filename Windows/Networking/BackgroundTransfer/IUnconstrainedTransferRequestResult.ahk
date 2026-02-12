#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IUnconstrainedTransferRequestResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnconstrainedTransferRequestResult
     * @type {Guid}
     */
    static IID => Guid("{4c24b81f-d944-4112-a98e-6a69522b7ebb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsUnconstrained"]

    /**
     * @type {Boolean} 
     */
    IsUnconstrained {
        get => this.get_IsUnconstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUnconstrained() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
