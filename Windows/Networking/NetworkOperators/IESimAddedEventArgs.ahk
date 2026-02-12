#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ESim.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{38bd0a58-4d5a-4d08-8da7-e73eff369ddd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ESim"]

    /**
     * @type {ESim} 
     */
    ESim {
        get => this.get_ESim()
    }

    /**
     * 
     * @returns {ESim} 
     */
    get_ESim() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESim(value)
    }
}
