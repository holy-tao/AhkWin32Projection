#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PerceptionColorFrameSourceWatcher.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PerceptionColorFrameSource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionColorFrameSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionColorFrameSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{5df3cca2-01f8-4a87-b859-d5e5b7e1de49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatcher", "FindAllAsync", "FromIdAsync", "RequestAccessAsync"]

    /**
     * 
     * @returns {PerceptionColorFrameSourceWatcher} 
     */
    CreateWatcher() {
        result := ComCall(6, this, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionColorFrameSourceWatcher(watcher)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<PerceptionColorFrameSource>>} 
     */
    FindAllAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, PerceptionColorFrameSource), result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {IAsyncOperation<PerceptionColorFrameSource>} 
     */
    FromIdAsync(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PerceptionColorFrameSource, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
