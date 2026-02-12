#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Web\Http\HttpResponseMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * For internal use only.
  * 
  * > [IMPORTANT]
  * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageproviderhttprequestprovider
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class ISysStorageProviderHttpRequestProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISysStorageProviderHttpRequestProvider
     * @type {Guid}
     */
    static IID => Guid("{cb6fefb6-e76a-5c25-a33e-3e78a6e0e0ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendRequestAsync"]

    /**
     * For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @param {HttpRequestMessage} request For internal use only.
     * 
     * > [IMPORTANT]
     * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
     * @returns {IAsyncOperation<HttpResponseMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageproviderhttprequestprovider.sendrequestasync
     */
    SendRequestAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HttpResponseMessage, operation)
    }
}
