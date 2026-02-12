#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialReceiverApp2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialReceiverApp2
     * @type {Guid}
     */
    static IID => Guid("{530c5805-9130-42ac-a504-1977dcb2ea8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUniqueDeviceNameAsync"]

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetUniqueDeviceNameAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }
}
