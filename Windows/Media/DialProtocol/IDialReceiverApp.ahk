#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialReceiverApp extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialReceiverApp
     * @type {Guid}
     */
    static IID => Guid("{fd3e7c57-5045-470e-b304-4dd9b13e7d11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdditionalDataAsync", "SetAdditionalDataAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IMap<HSTRING, HSTRING>>} 
     */
    GetAdditionalDataAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMap.Call.Bind(IMap, (ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr })), operation)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} additionalData 
     * @returns {IAsyncAction} 
     */
    SetAdditionalDataAsync(additionalData) {
        result := ComCall(7, this, "ptr", additionalData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
