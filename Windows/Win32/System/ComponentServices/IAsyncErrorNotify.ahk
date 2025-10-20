#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to implement error trapping on the asynchronous batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iasyncerrornotify
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IAsyncErrorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncErrorNotify
     * @type {Guid}
     */
    static IID => Guid("{fe6777fb-a674-4177-8f32-6d707e113484}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnError"]

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iasyncerrornotify-onerror
     */
    OnError(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }
}
