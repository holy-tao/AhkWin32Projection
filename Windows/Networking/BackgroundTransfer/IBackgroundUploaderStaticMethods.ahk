#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UploadOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundUploaderStaticMethods extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploaderStaticMethods
     * @type {Guid}
     */
    static IID => Guid("{f2875cfb-9b05-4741-9121-740a83e247df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentUploadsAsync", "GetCurrentUploadsForGroupAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     */
    GetCurrentUploadsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UploadOperation), operation)
    }

    /**
     * 
     * @param {HSTRING} group 
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     */
    GetCurrentUploadsForGroupAsync(group) {
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group

        result := ComCall(7, this, "ptr", group, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UploadOperation), operation)
    }
}
