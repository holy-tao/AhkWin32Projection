#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DownloadOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundDownloaderStaticMethods extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundDownloaderStaticMethods
     * @type {Guid}
     */
    static IID => Guid("{52a65a35-c64e-426c-9919-540d0d21a650}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDownloadsAsync", "GetCurrentDownloadsForGroupAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<DownloadOperation>>} 
     */
    GetCurrentDownloadsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, DownloadOperation), operation)
    }

    /**
     * 
     * @param {HSTRING} group 
     * @returns {IAsyncOperation<IVectorView<DownloadOperation>>} 
     */
    GetCurrentDownloadsForGroupAsync(group) {
        if(group is String) {
            pin := HSTRING.Create(group)
            group := pin.Value
        }
        group := group is Win32Handle ? NumGet(group, "ptr") : group

        result := ComCall(7, this, "ptr", group, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, DownloadOperation), operation)
    }
}
